note
	description: "Database Access Controller"

class
	EP_DB

inherit
	SLE_DB_AWARE

feature {NONE} -- Initialize

	default_create
			--<Precursor>
		local
			l_file: PLAIN_TEXT_FILE
		do
			create factory
			create_db_path
			database.do_nothing -- create fresh, if needed

			create l_file.make_with_name (Db_file_name)
			if l_file.count = 0 then -- is empty (fresh creation)
				make_from_scratch
			end
		end

feature -- Access

	factory: SLE_FACTORY
			-- A `factory' for doing DB things.

	db_file_name: STRING = "epump.sqlite3"
			-- What to call the DB for this app.

feature {NONE} -- Implementation: DB Recreation

	make_from_scratch
			-- Create a new DB from scratch.
		require
			database.is_accessible and then database.is_writable
		do
			-- Create tables with PK/FK for joins
			-- Primary table (pumps) with INT PK
			-- Secondary table (readings) with INT PK/FK and "reading type" as well as value

			factory.add_text_field ("tool")
			factory.add_text_field ("chamber")
			factory.add_text_field ("model")
			factory.create_new_table (database, "pump", "pump_pk", factory.field_array)

			factory.clear_fields

			factory.add_integer_field ("pump_fk")
			factory.add_date_field ("reading_date")
			factory.add_real_field ("value")
			factory.add_text_field ("code")
			factory.add_boolean_field ("is_exhaust")
			factory.create_new_table (database, "pump_data", "reading_pk", factory.field_array)

			factory.clear_fields
		end

end
