note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	EP_PUMP_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	ep_pump_creation_tests
			-- `ep_pump_creation_tests'
		local
			l_item: EP_PUMP
			l_data: EP_TEST_DATA
		do
			create l_item.make ("tool", "chamber", "model", 1)
			assert_strings_equal ("key", "tool-chamber-model", l_item.key)

			create l_data
			l_item := l_data.Test_pump_list.i_th (1)
			assert_strings_equal ("tool_from_data", "CFAMT01X", l_item.tool)
			assert_strings_equal ("chamber_from_data", "A", l_item.chamber)
			assert_strings_equal ("model_from_data", "80/500", l_item.model)

			assert_integers_equal ("four_data_points", 4, l_item.exhaust_data.count)
				-- NOTE: `iteration_item' uses the very odd (for Eiffel) 0-based array reference rather than the normal 1-based.
			assert_strings_equal ("exhaust_date_1", "06/07/2020", l_item.exhaust_data.iteration_item (0).t_date.out)
			assert_strings_equal ("exhaust_date_1", "06/06/2020", l_item.exhaust_data.iteration_item (1).t_date.out)
			assert_strings_equal ("exhaust_date_1", "06/05/2020", l_item.exhaust_data.iteration_item (2).t_date.out)
			assert_strings_equal ("exhaust_date_1", "06/03/2020", l_item.exhaust_data.iteration_item (3).t_date.out)

			assert_strings_equal ("temperature_date_1", "06/07/2020", l_item.temperature_data.iteration_item (0).t_date.out)
			assert_strings_equal ("temperature_date_1", "06/06/2020", l_item.temperature_data.iteration_item (1).t_date.out)
			assert_strings_equal ("temperature_date_1", "06/05/2020", l_item.temperature_data.iteration_item (2).t_date.out)
			assert_strings_equal ("temperature_date_1", "06/03/2020", l_item.temperature_data.iteration_item (3).t_date.out)


			create l_item.make_from_delimited_string (l_data.test_pumps [100])
			assert_strings_equal ("tool_from_data_100", "CELRC05X", l_item.tool)
			assert_strings_equal ("chamber_from_data_100", "3", l_item.chamber)
			assert_strings_equal ("model_from_data_100", "iQ80", l_item.model)
		end

	ep_pump_average_exhuast_delta_test
			-- Are we computing the average_exhuast_delta correctly?
		local
			l_item: EP_PUMP
			l_data: EP_TEST_DATA
		do
			create l_data

			--	CFAMT01X	A	80/500	4	3	2	1		1	1	1	3	1
			l_item := l_data.Test_pump_list.i_th (1)
			assert_strings_equal ("exhaust_delta_sum_1", "3", l_item.exhaust_delta_sum.out)
			assert_strings_equal ("average_exhuast_delta_1", "1", l_item.average_exhuast_delta.out)

			assert_strings_equal ("temperature_delta_sum_1", "0", l_item.temperature_delta_sum.out)
			assert_strings_equal ("average_temperature_delta_1", "0", l_item.average_temperature_delta.out)

			--	CFAMT01X	B	80/500	3.6	3	2.4	2.4		0.6	0.6	0	1.2	0.4
			l_item := l_data.Test_pump_list.i_th (2)
			assert_strings_equal ("exhaust_delta_sum_2", "1.2", l_item.exhaust_delta_sum.out)
			assert_strings_equal ("average_exhuast_delta_2", "0.4", l_item.average_exhuast_delta.out)

			--	CFAMT01X	DTLR	iQ40	3.6	3	2.5	2		0.6	0.5	0.5	1.6	0.533333333
			l_item := l_data.Test_pump_list.i_th (5)
			assert_strings_equal ("exhaust_delta_sum_5", "1.6", l_item.exhaust_delta_sum.out)
			assert_strings_equal ("average_exhuast_delta_5", "0.533333", l_item.average_exhuast_delta.out)

			assert_strings_equal ("temperature_delta_sum_5", "2", l_item.temperature_delta_sum.out)
			assert_strings_equal ("average_temperature_delta_5", "0.666667", l_item.average_temperature_delta.out)

		end

end


