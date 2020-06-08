note
	description: "Database Access Controller"

class
	EP_DB

inherit
	SLE_DB_AWARE

feature {NONE} -- Initialize

	default_create
			--<Precursor>
		note
			design: "[
				Use case: Erase the epump.sqlite3 DB file from the disk
				and this creation routine will not only create a new DB
				file, but will populate it with the appropriate tables.
				Note that the tables will be empty. It will not make data.
				]"
		local
			l_file: PLAIN_TEXT_FILE
		do
			create factory
			create_db_path
			database.do_nothing -- create fresh, if needed

			create l_file.make_with_name (Db_file_name)
			if l_file.count = 0 then -- is empty (fresh creation)
				make_empty_from_scratch
			end
		end

feature -- Access

	factory: SLE_FACTORY
			-- A `factory' for doing DB things.

feature -- Constants

	db_file_name: STRING = "epump.sqlite3"
			-- What to call the DB for this app.

feature {NONE} -- Implementation: DB Recreation

	make_empty_from_scratch
			-- Create an empty new DB from scratch.
		require
			database.is_accessible and then database.is_writable
		local
			l_modify: SQLITE_MODIFY_STATEMENT
		do
				-- Ensure our tables are gone first
			create l_modify.make (" DROP TABLE IF EXISTS pump; ", database)
			l_modify.execute
			create l_modify.make (" DROP TABLE IF EXISTS pump_data; ", database)
			l_modify.execute

				-- Create tables with PK/FK for joins
				-- Primary table (pumps) with INT PK
				-- Secondary table (readings) with INT PK/FK and "reading type" as well as value

			factory.add_text_field ("tool")
			factory.add_text_field ("chamber")
			factory.add_text_field ("model")
			factory.add_text_field ("key")
			factory.create_new_table (database, "pump", "pk", factory.field_array)

			factory.clear_fields

			factory.add_integer_field ("pump_fk")
			factory.add_date_field ("value_date")
			factory.add_real_field ("value")
			factory.add_text_field ("type")
			factory.create_new_table (database, "pump_data", "pk", factory.field_array)

			factory.clear_fields

		end

feature {EP_TEST_SET_BRIDGE, TEST_SET_BRIDGE} -- Testing Ops

	load_test_data (a_is_my_caller_a_test_procedure: BOOLEAN)
			-- Load data from {EP_TEST_DATA}
		note
			warning: "[
				Running this code takes about 150 seconds!
				Yeah--it's not that efficient!
				]"
			design: "[
				Because this code is very edge-case and time
				expensive, I have created two hurdles to get
				over before using it.
				
				1. The feature export to the bridge classes.
				2. The require contract (below).
				
				So--you must deliberately handle these two
				matters if you want to call this feature.
				]"
		require
			do_not_call_me_unless: a_is_my_caller_a_test_procedure -- testing only
		local
			l_data: EP_TEST_DATA
			l_modify: SQLITE_MODIFY_STATEMENT
			l_insert: SLE_CREATE
			l_fields: ARRAY [TUPLE [col_name, col_value: STRING]]
			l_sql: STRING
			i,j: INTEGER
		do
				-- Load Pump test data
			create l_data

			across
				l_data.Test_pump_list as ic
			from
				i := 1
			loop
				create l_insert
				l_fields := <<
							["tool", "%"" + ic.item.tool + "%""],
							["chamber", "%"" + ic.item.chamber + "%""],
							["model", "%"" + ic.item.model + "%""],
							["key", "%"" + ic.item.key + "%""]
							>>
				l_sql := l_insert.generate_insert_sql ("pump", l_fields)
				create l_modify.make (l_sql, database)
				l_modify.execute

					-- Pump_data: Exhaust
				check has_exhaust_data: attached l_data.Test_pump_exhaust_data.i_th (i) as al_string then
					check has_value: attached l_data.Test_pump_exhaust_data.i_th (i) as al_values then
						across
							al_values.split (',') as al_value
						from
							j := 1
						loop
							l_fields := <<
										["pump_fk", i.out],
										["value_date", "%"" + l_data.Test_pump_dates.i_th (j).out + "%""],
										["value", al_value.item.out],
										["type", "%"" + "EXHAUST" + "%""]
										>>
							l_sql := l_insert.generate_insert_sql ("pump_data", l_fields)
							create l_modify.make (l_sql, database)
							l_modify.execute
							j := j + 1
						end
					end
				end
					-- Pump_data: Temperature
				check has_temperature_data: attached l_data.Test_pump_temperature_data.i_th (i) as al_string then
					check has_value: attached l_data.Test_pump_temperature_data.i_th (i) as al_values then
						across
							al_values.split (',') as al_value
						from
							j := 1
						loop
							l_fields := <<
										["pump_fk", i.out],
										["value_date", "%"" + l_data.Test_pump_dates.i_th (j).out + "%""],
										["value", al_value.item.out],
										["type", "%"" + "TEMPERATURE" + "%""]
										>>
							l_sql := l_insert.generate_insert_sql ("pump_data", l_fields)
							create l_modify.make (l_sql, database)
							l_modify.execute
							j := j + 1
						end
					end
				end
				i := i + 1
			end
		end

end
