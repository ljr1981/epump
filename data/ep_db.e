note
	description: "Database Access Controller"
	ca_ignore: "CA005"	-- "	Unneeded object test local	EP_DB	97, 20	40	"

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
			if l_file.is_empty then
				make_empty_from_scratch
			end
		end

feature -- Queries

	pump_count: INTEGER
			-- How many pumps in our DB?
		do
			Result := sql_query_integer (" SELECT COUNT(pk) FROM pump; ")
		end

	has_pumps: BOOLEAN
			-- Do we have pumps in DB?
		do
			Result := pump_count > 0
		end

	is_pump_in_db (a_pump: EP_PUMP): BOOLEAN
			-- Is `a_pump' already in the DB?
		local
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			l_sql := "SELECT COUNT(*) FROM pump WHERE key='" + a_pump.key + "';"
			create l_modify.make (l_sql, database)
			check compiled: l_modify.is_compiled end
			across
				l_modify.execute_new as ic
			loop
				Result := ic.item.integer_value (column_one_const) = (True).to_integer
			end
		end

	pump_has_data (a_pump: EP_PUMP): BOOLEAN
			-- Does `a_pump' have data in pump_data?
		require
			has_pump: is_pump_in_db (a_pump)
		local
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			l_sql := " SELECT COUNT(*) FROM pump_data WHERE pump_fk = " + pump_pk (a_pump).out + " ;"
			create l_modify.make (l_sql, database)
			check compiled: l_modify.is_compiled end
			across
				l_modify.execute_new as ic
			loop
				Result := ic.item.integer_value (column_one_const) > 0
			end
		ensure
			still_has_pump: is_pump_in_db (a_pump)
		end

feature -- SQL Queries

	sql_query_boolean (a_sql: STRING): BOOLEAN
			-- A `sql_query' returning one BOOLEAN value
		do
			Result := sql_query (a_sql).item.boolean_value (1)
		end

	sql_query_integer (a_sql: STRING): INTEGER
			-- A `sql_query' returning one INTEGER value.
		do
			Result := sql_query (a_sql).item.integer_value (1)
		end

	sql_query_integer_list (a_sql: STRING): ARRAYED_LIST [INTEGER]
			-- A `sql_query' returning a list of INTEGER values.
		local
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			create Result.make (100)
			across
				sql_query (a_sql) as ic
			loop
				Result.force (ic.item.integer_value (1))
			end
		end

feature -- Basic Operations

	all_pumps: ARRAYED_LIST [EP_PUMP]
			-- Load `all_pumps' from DB.
		do
			create Result.make (pump_count)
		end


	-- pump_by_pk
	-- pump_by_key
	-- pumps_in_pk_range
	-- pumps_by_criteria
	-- pumps_by_key
	-- pumps_like_key
	-- pumps_by_chamber
	-- pumps_like_chamber
	-- pumps_by_model
	-- pumps_like_model

	-- add a new pump

	add_new_pump (a_pump: EP_PUMP; a_update_agent: PROCEDURE)
			-- Add a new `a_pump' to DB.
		local
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			if is_pump_in_db (a_pump) then
				do_nothing -- swallow it and "create silently"
			else
				l_sql := " INSERT INTO pump (tool, chamber, model, key) VALUES (" +
							"%"" + a_pump.tool + "%"," +
							"%"" + a_pump.chamber + "%"," +
							"%"" + a_pump.model + "%"," +
							"%"" + a_pump.key + "%") ; "
				create l_modify.make (l_sql, database)
				check compiled: l_modify.is_compiled end
				l_modify.execute
			end
		end

	add_new_pump_from_raw (a_tool, a_chamber, a_model: STRING; a_update_agent: PROCEDURE)
			-- Add a new pump from raw data to DB.
		require
			not_empty: not a_tool.is_empty and then
						not a_chamber.is_empty and then
						not a_model.is_empty
		do
			add_new_pump (create {EP_PUMP}.make (a_tool, a_chamber, a_model), a_update_agent)
		end

	-- add new pump-data for a pump

	add_new_pump_data (a_data: ARRAY [EP_PUMP]; a_update_agent: PROCEDURE)
			-- Add a new pump_data from a_data list of Pumps.
		do
			across
				a_data as ic_data
			loop
				add_new_pump_datum (ic_data.item, a_update_agent)
			end
		end

	add_new_pump_datum (a_pump: EP_PUMP; a_update_agent: PROCEDURE)
			-- Add a single datum from `a_pump'.
		local
			l_pk: INTEGER
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			l_pk := pump_pk (a_pump)
			l_sql := " INSERT INTO pump_data (pump_fk, value_date, value, type) VALUES (" +
						"%"<<PUMP_FK>>%"," +
						"%"<<VALUE_DATE>>%"," +
						"%"<<VALUE>>%"," +
						"%"<<TYPE>>%" ) ; "

			across
				a_pump.exhaust_data as ic_exhaust
			loop
				check attached l_sql as al_sql then
					al_sql.replace_substring_all ("<<PUMP_FK>>", l_pk.out)
					al_sql.replace_substring_all ("<<VALUE_DATE>>", ic_exhaust.item.t_date.out)
					al_sql.replace_substring_all ("<<VALUE>>", ic_exhaust.item.t_value.out)
					al_sql.replace_substring_all ("<<TYPE>>", "EXHAUST")
					create l_modify.make (al_sql, database)
					l_modify.execute
				end
			end
			across
				a_pump.temperature_data as ic_temperature
			loop
				check attached l_sql as al_sql then
					al_sql.replace_substring_all ("<<PUMP_FK>>", l_pk.out)
					al_sql.replace_substring_all ("<<VALUE_DATE>>", ic_temperature.item.t_date.out)
					al_sql.replace_substring_all ("<<VALUE>>", ic_temperature.item.t_value.out)
					al_sql.replace_substring_all ("<<TYPE>>", "TEMPERATURE")
					create l_modify.make (al_sql, database)
					l_modify.execute
				end
			end
		end

	-- update pump information
	-- update pump-data information
	-- delete a pump and it's pump-data

	delete_pump_with_data (a_pump: EP_PUMP; a_update_agent: PROCEDURE)
			--
		require
			has_pump: is_pump_in_db (a_pump)
		local
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
			l_pk: INTEGER
			l_fk_list: ARRAYED_LIST [INTEGER]
		do
			l_pk := pump_pk (a_pump)
			check has_pump: l_pk > 0 end
			if l_pk > 0 then
					-- locate the pump-data by `l_pk' and delete it
				l_sql := " DELETE FROM pump_data WHERE pump_fk IN (SELECT pk FROM pump WHERE pk = " + l_pk.out + ") ;"
				create l_modify.make (l_sql, database)
				check compiled: l_modify.is_compiled end
				l_modify.execute
					-- ensure it's gone
				check data_gone: not pump_has_data (a_pump) end

					-- locate the pump and delete it
				l_sql := " DELETE FROM pump WHERE pk = " + l_pk.out + " ;"
				create l_modify.make (l_sql, database)
				check compiled: l_modify.is_compiled end
				l_modify.execute
			end
		ensure
			pump_deleted: not is_pump_in_db (a_pump) -- ensure it's gone
		end

	pump_pk (a_pump: EP_PUMP): INTEGER
			-- What is the PK for `a_pump'?
		local
			l_sql: STRING
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			l_sql := " SELECT pk FROM pump WHERE key= '" + a_pump.key + "' ;"
			create l_modify.make (l_sql, database)
			check compiled: l_modify.is_compiled end
			across
				l_modify.execute_new as ic
			loop
				Result := ic.item.integer_value (column_one_const)
			end
		end

	-- export pumps and pump-date to XML (standard XML file)
	-- export pumps and pump-date to CSV (standard comma-separated-value file)
	-- export pumps and pump-date to XLM (Excel spreadsheet)
	-- export pumps and pump-date to HTML (report with SVG graphics)
	-- export pumps and pump-date to SVG (graphical representation)

	-- import pumps from XML
	-- import pump-data from XML
	-- import pumps from CSV
	-- import pump-data from CSV

	column_one_const: NATURAL_32 = 1

feature -- Constants: Helpers

	sql_select: SLE_READ once create Result end

feature -- Access

	factory: SLE_FACTORY
			-- A `factory' for doing DB things.

feature -- Constants

	db_file_name: STRING = "epump.sqlite3"
			-- What to call the DB for this app.

feature {NONE} -- Implementation: SQL Command & Query

	sql_command (a_sql: STRING)
		local
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			sql_query (a_sql).do_nothing
		end

	sql_query (a_sql: STRING): SQLITE_STATEMENT_ITERATION_CURSOR
		local
			l_modify: SQLITE_MODIFY_STATEMENT
		do
			create l_modify.make (a_sql, database)
			Result := l_modify.execute_new
		end

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
