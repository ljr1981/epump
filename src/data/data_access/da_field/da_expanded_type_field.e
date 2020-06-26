note
	description: "Abstract notion of a Data Access Field based on an Expanded Type."

deferred class
	DA_EXPANDED_TYPE_FIELD [S -> SQLITE_BIND_ARG [ANY] create make end, D -> ANY]

inherit
	DA_FIELD [S, D]
		redefine
			value
		end

feature -- Access

	value: D
			-- Type anchor for Eiffel Data Type.

end
