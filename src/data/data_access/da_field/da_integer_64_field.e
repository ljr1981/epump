note
	description: "Abstract notion of an INTEGER_64 field."

deferred class
	DA_INTEGER_64_FIELD

inherit
	DA_EXPANDED_TYPE_FIELD [SQLITE_INTEGER_ARG, INTEGER_64]
		redefine
			sqlite_bind_arg
		end

feature -- Access

	sqlite_bind_arg: SQLITE_INTEGER_ARG
			--<Precursor>
		attribute
			create Result.make ("$" + name, 0)
		end

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
			if attached sqlite_bind_arg as al_arg and then
				attached al_arg.value as al_value
			then
				Result := al_value.out
			else
				create Result.make_empty
			end
		end

	formatted_value_out (a_value: attached like sqlite_bind_arg_value_anchor): STRING
			--<Precursor>
		do
			Result := a_value.out
		end

end
