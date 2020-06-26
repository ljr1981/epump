note
	description: "Notion of a Pump Status field."

class
	EP_PUMP_STATUS_FLD

inherit
	DA_INTEGER_64_FIELD

feature -- Access

	table_name: STRING = "pump"

	name: STRING = "status"

	is_primary_key: BOOLEAN = False

	is_auto_increment: BOOLEAN = False

	is_sorted: BOOLEAN = True

	is_ascending: BOOLEAN = True

end
