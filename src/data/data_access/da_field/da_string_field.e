note
	description: "Abstract notion of a STRING field"

deferred class
	DA_STRING_FIELD

inherit
	DA_FIELD [SQLITE_STRING_ARG, detachable READABLE_STRING_8]

feature -- Basic Operations

	sqlite_to_eiffel (a_value: like sqlite_bind_arg.value): like value
			-- Convert `sqlite_to_eiffel'.
		do
			Result := a_value
		end

	eiffel_to_sqlite (a_value: like value): like sqlite_bind_arg.value
			-- Convert `eiffel_to_sqlite'.
		do
			Result := a_value
		end

feature -- Output

	value_out: STRING
			--<Precursor>
		do
			if
				attached sqlite_bind_arg as al_arg and then
				attached al_arg.value as al_value
			then
				Result := al_value
			else
				create Result.make_empty
			end
			Result.prepend_character ('%'')
			Result.append_character ('%'')
		end

end
