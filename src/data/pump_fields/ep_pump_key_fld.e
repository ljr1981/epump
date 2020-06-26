note
	description: "Notion of a Pump Key field"

class
	EP_PUMP_KEY_FLD

inherit
	DA_STRING_FIELD

feature -- Access

	table_name: STRING = "pump"

	name: STRING = "key"

	is_primary_key: BOOLEAN = False

	is_auto_increment: BOOLEAN = False

	is_sorted: BOOLEAN = True

	is_ascending: BOOLEAN = True

end
