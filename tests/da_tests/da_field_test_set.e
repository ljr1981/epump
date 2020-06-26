note
	description: "Demonstration of Pump Input Component(s)"
	testing: "type/manual"

class
	DA_FIELD_TEST_SET

inherit
	TEST_SET_SUPPORT_VISION2

feature -- Test routines

	da_field_tests
			-- Tests of DA_FIELD et al
		note
			testing: "execution/serial"
		local
			l_pump_pk: EP_PUMP_PK_FLD
			l_pump_tool: EP_PUMP_TOOL_FLD
			l_pump_chamber: EP_PUMP_CHAMBER_FLD
			l_pump_model: EP_PUMP_MODEL_FLD
			l_pump_key: EP_PUMP_KEY_FLD
			l_pump_status: EP_PUMP_STATUS_FLD
		do
			create l_pump_pk
			create l_pump_tool
			create l_pump_chamber
			create l_pump_model
			create l_pump_key
			create l_pump_status
		end
end
