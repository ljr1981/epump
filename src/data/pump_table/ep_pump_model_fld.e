note
	description: "Notion of a Pump Model field"

class
	EP_PUMP_MODEL_FLD

inherit
	DA_STRING_FIELD

feature -- Access

	table_name: STRING = "pump"

	name: STRING = "model"

	is_primary_key: BOOLEAN = False

	is_auto_increment: BOOLEAN = False

	is_sorted: BOOLEAN = True

	is_ascending: BOOLEAN = True

end
