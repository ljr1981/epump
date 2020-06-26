note
	description: "Notion of MOCK Character field"

class
	MOCK_CHAR_FLD

inherit
	DA_CHARACTER_FIELD

feature -- Access

	table_name: STRING = "mock"

	name: STRING = "mock_character"

	is_primary_key: BOOLEAN = False

	is_auto_increment: BOOLEAN = False

	is_sorted: BOOLEAN = True

	is_ascending: BOOLEAN = True

feature -- Basic Operations

	sqlite_to_eiffel (a_value: STRING): CHARACTER
			-- Convert `sqlite_to_eiffel'.
		do
			if a_value.is_empty then
				Result := ' '
			else
				Result := a_value.item (1)
			end
		end

	eiffel_to_sqlite (a_value: CHARACTER): STRING
			-- Convert `eiffel_to_sqlite'.
		do
			Result := a_value.out
		end

feature -- Output

	value_out: STRING
			--<Precursor>
		do
			if
				attached sqlite_bind_arg as al_value
			then
				Result := al_value
			else
				create Result.make_empty
			end
			Result.prepend_character ('%'')
			Result.append_character ('%'')
		end

	formatted_value_out (a_value: detachable STRING): STRING
			--<Precursor>
		do
			if attached a_value as al_value then
				Result := al_value
			else
				create Result.make_empty
			end
			Result.prepend_character ('%'')
			Result.append_character ('%'')
		end

end
