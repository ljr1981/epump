note
	description: "Abstract notion of a Data Access Field based on an BOOLEAN Type."

deferred class
	DA_BOOLEAN_FIELD

inherit
	DA_FIELD [BOOLEAN, BOOLEAN]
		redefine
			value
		end

feature -- Access

	value: BOOLEAN
			-- Type anchor for Eiffel Data Type.

end
