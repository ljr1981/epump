note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	EP_EVALUATOR_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	ep_evaluator_tests
			-- New test routine
		local
			l_data: EP_TEST_DATA
			l_evaluator: EP_EVALUATOR
			l_result_list: HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
		do
			create l_data
			create l_evaluator

			l_result_list := l_evaluator.imminent_exhaust_hazard_list (l_data.Test_pump_list.to_array)
			assert_integers_equal ("imminent_exhaust_hazard_list", 2, l_result_list.count)

			l_result_list := l_evaluator.imminent_exhaust_rate_failure_list (l_data.Test_pump_list.to_array)
			assert_integers_equal ("imminent_exhaust_rate_failure_list", 2, l_result_list.count)

			l_result_list := l_evaluator.imminent_pressure_level_failure_list (l_data.Test_pump_list.to_array)
			assert_integers_equal ("imminent_pressure_level_failure_list", 0, l_result_list.count)

			l_result_list := l_evaluator.potential_exhaust_hazard_list (l_data.Test_pump_list.to_array)
			assert_integers_equal ("potential_count", 3, l_result_list.count)

			l_result_list := l_evaluator.potential_exhaust_rate_failure_list (l_data.Test_pump_list.to_array)
			assert_integers_equal ("potential_exhaust_rate_failure_list", 3, l_result_list.count)

			l_result_list := l_evaluator.potential_pressure_level_failure_list (l_data.Test_pump_list.to_array)
			assert_integers_equal ("potential_pressure_level_failure_list", 0, l_result_list.count)

		end

end


