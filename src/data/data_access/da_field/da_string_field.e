note
	description: "Abstract notion of a STRING field"

deferred class
	DA_STRING_FIELD

inherit
	DA_FIELD [detachable STRING, detachable STRING]

feature -- Basic Operations

	sqlite_to_eiffel (a_value: STRING): STRING
			-- Convert `sqlite_to_eiffel'.
		do
			Result := a_value
		end

	eiffel_to_sqlite (a_value: STRING): STRING
			-- Convert `eiffel_to_sqlite'.
		do
			Result := a_value
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
