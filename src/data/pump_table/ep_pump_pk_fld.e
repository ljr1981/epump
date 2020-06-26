note
	description: "Notion of a Pump PK field."

class
	EP_PUMP_PK_FLD

inherit
	DA_INTEGER_PK_FIELD

feature -- Access

	table_name: STRING = "pump"

	name: STRING = "pk"

end
