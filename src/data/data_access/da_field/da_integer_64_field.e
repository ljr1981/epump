note
	description: "Abstract notion of an INTEGER_64 field."

deferred class
	DA_INTEGER_64_FIELD

inherit
	DA_NUMERIC_FIELD [INTEGER_64, INTEGER_64]
		redefine
			sqlite_bind_arg
		end

feature -- Access

	sqlite_bind_arg: INTEGER_64
			--<Precursor>
		do
			Result := Precursor
		end

feature -- Basic Operations

	sqlite_to_eiffel (a_value: INTEGER_64): INTEGER_64
			-- Convert `sqlite_to_eiffel'.
		do
			Result := a_value
		end

	eiffel_to_sqlite (a_value: INTEGER_64): INTEGER_64
			-- Convert `eiffel_to_sqlite'.
		do
			Result := a_value
		end

feature -- Output

	value_out: STRING
			--<Precursor>
		do
			if attached sqlite_bind_arg as al_value
			then
				Result := al_value.out
			else
				create Result.make_empty
			end
		end

	formatted_value_out (a_value: INTEGER_64): STRING
			--<Precursor>
		do
			Result := a_value.out
		end

end
