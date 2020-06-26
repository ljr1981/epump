note
	description: "Abstract notion of a INTEGER_64 Primary Key Field."

deferred class
	DA_INTEGER_PK_FIELD

inherit
	DA_INTEGER_64_FIELD

feature -- Access

	is_primary_key: BOOLEAN = True

	is_auto_increment: BOOLEAN = True

	is_sorted: BOOLEAN = True

	is_ascending: BOOLEAN = True

end
