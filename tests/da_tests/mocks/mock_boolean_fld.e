note
	description: "Notion of MOCK Boolean field"

class
	MOCK_BOOLEAN_FLD

inherit
	DA_BOOLEAN_FIELD

feature -- Access

	table_name: STRING = "mock"

	name: STRING = "mock_boolean"

	is_primary_key: BOOLEAN = False

	is_auto_increment: BOOLEAN = False

	is_sorted: BOOLEAN = True

	is_ascending: BOOLEAN = True

feature -- Basic Operations

	sqlite_to_eiffel (a_value: INTEGER): BOOLEAN
			-- Convert `sqlite_to_eiffel'.
		do
			Result := a_value.to_boolean
		end

	eiffel_to_sqlite (a_value: BOOLEAN): INTEGER
			-- Convert `eiffel_to_sqlite'.
		do
			Result := a_value.to_integer
		end

feature -- Output

	value_out: STRING
			--<Precursor>
		do
			if
				attached sqlite_bind_arg as al_value
			then
				Result := al_value.out
			else
				create Result.make_empty
			end
		end

	formatted_value_out (a_value: INTEGER): STRING
			--<Precursor>
		do
			if attached a_value as al_value then
				Result := al_value.out
			else
				create Result.make_empty
			end
		end

end
