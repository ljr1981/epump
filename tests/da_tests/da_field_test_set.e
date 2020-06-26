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
			l_pump: EP_PUMP_TABLE
		do
			create l_pump_pk
			l_pump_pk.add_where_lt (False, 20, "OR")
			assert_strings_equal ("where_lt", "pk < 20 OR ", l_pump_pk.where_out)
			l_pump_pk.add_where_between (False, 1, 20, Void)
			assert_strings_equal ("where_between_1_20", "pk < 20 OR pk BETWEEN 1 AND 20", l_pump_pk.where_out)

			create l_pump_tool
			create l_pump_chamber
			create l_pump_model
			create l_pump_key
			create l_pump_status

			create l_pump
			l_pump.add_fields (<<l_pump_pk, l_pump_tool, l_pump_chamber, l_pump_model, l_pump_key, l_pump_status>>)
			assert_strings_equal ("select_sql", " SELECT pk, tool, chamber, model, key, status FROM pump WHERE pk < 20 OR pk BETWEEN 1 AND 20;", l_pump.select_sql_statement)
			l_pump_tool.set_value ("TOOL_NAME")
			l_pump_chamber.set_value ("CHAMBER_NAME")
			l_pump_model.set_value ("MODEL_NAME")
			l_pump_key.set_value ("SERIAL_NO")
			l_pump_status.set_value ({EP_PUMP}.In_service_code)
			assert_strings_equal ("insert_sql", " INSERT INTO pump (tool, chamber, model, key, status) VALUES ('TOOL_NAME', 'CHAMBER_NAME', 'MODEL_NAME', 'SERIAL_NO', 1);", l_pump.insert_sql_statement)
		end

	mock_field_tests

		note
			testing: "execution/serial"
		local
			l_bool: MOCK_BOOLEAN_FLD
			l_char: MOCK_CHAR_FLD
		do
			create l_bool
			l_bool.add_where_equal (False, (True).to_integer, Void)
			assert_strings_equal ("where_equal", "mock_boolean = 1", l_bool.where_out)

			create l_char
			l_char.add_where_equal (False, "X", Void)
			assert_strings_equal ("where_equal", "mock_character = 'X'", l_char.where_out)
		end

end
