note
	description: "Abstract notion of a Data Access Field based on an NUMERIC Type."

deferred class
	DA_NUMERIC_FIELD [S -> NUMERIC, D -> NUMERIC]

inherit
	DA_FIELD [S, D]
		redefine
			value
		end

feature -- Access

	value: D
			-- Type anchor for Eiffel Data Type.

end
