note
	description: "Tests of {EP_TEST_DATA}."
	testing: "type/manual"

class
	EP_TEMP_DATA_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	epump_data_tests
			-- `epump_data_tests'
		local
			l_data: EP_TEST_DATA
			l_pump: EP_PUMP
		do
			create l_data

			l_data.test_pumps.do_nothing
			l_data.test_pump_exhaust_data.do_nothing
			l_data.Test_pump_temperature_data.do_nothing
			l_data.test_pump_dates.do_nothing

			assert_integers_equal ("138_pumps", 138, l_data.test_pump_list.count)

			assert_strings_equal ("tool_from_data", "CFAMT01X", l_data.test_pump_list [1].tool)
			assert_strings_equal ("chamber_from_data", "A", l_data.test_pump_list [1].chamber)
			assert_strings_equal ("model_from_data", "80/500", l_data.test_pump_list [1].model)

			assert_strings_equal ("tool_from_data_100", "CELRC05X", l_data.test_pump_list [100].tool)
			assert_strings_equal ("chamber_from_data_100", "3", l_data.test_pump_list [100].chamber)
			assert_strings_equal ("model_from_data_100", "iQ80", l_data.test_pump_list [100].model)

			l_pump := l_data.test_pump_list [1]
			check has_latest_item: attached l_pump.latest_exhaust_item as al_item then
				assert_strings_equal ("latest_exhaust_date", "06/07/2020", al_item.t_date.out)
			end
		end

end
