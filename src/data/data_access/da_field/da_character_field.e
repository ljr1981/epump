note
	description: "Abstract notion of a Data Access Field based on a CHARACTER Type."

deferred class
	DA_CHARACTER_FIELD

inherit
	DA_FIELD [STRING, CHARACTER]
		redefine
			value
		end

feature -- Access

	value: CHARACTER
			-- Type anchor for Eiffel Data Type.

end
