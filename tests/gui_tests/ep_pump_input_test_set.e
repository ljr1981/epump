note
	description: "Demonstration of Pump Input Component(s)"
	testing: "type/manual"

class
	EP_PUMP_INPUT_TEST_SET

inherit
	TEST_SET_SUPPORT_VISION2

feature -- Simple Inputs

	simple_pump_input_tests
			-- Demonstration of pump data input
		note
			explanation: "[
				Mask characters explained:
				
				When Current is repeating-masked, this character represents 
				the nature of that mask.
				
				'!' - Force input to upper case
				'#' - Only digits and spaces are allowed, an error message 
						of missing required characters is reported to the user
				'_' - only digits and spaces are allowed, no error message 
						reported for having spaces
				'9' - Only digits are allowed
				'A' - Only alphabetic characters are allowed. Numbers converted to spaces.
				'K' - Only uppercase alphabetic, numeric, and dash characters are allowed.
				'N' - Only letters and digits are allowed. (e.g. NO SPECIAL CHARACTERS).
				'U' - Only alphabetic characters are allowed (FORCED TO 
						UPPER CASE AND OTHERS CONVERTED TO SPACES).
				'W' - Only alphabetic characters are allowed (FORCED TO LOWER CASE).
				'X' - Permit any character

				]"
		local
			l_item: EV_VERTICAL_BOX
		do
			create l_item

			l_item.extend (masked_foced_upper_case_text ("Serial No").box)
			l_item.extend (masked_foced_upper_case_text ("Tool").box)
			l_item.extend (masked_foced_upper_case_text ("Chamber").box)
			l_item.extend (masked_foced_upper_case_text ("Model").box)

				-- Setup and Demo
			show_me := True
			demonstrate_widget (l_item)
		end

feature  {NONE} -- Implementation: Simple Inputs Support

	masked_foced_upper_case_text (a_text: STRING): MASKED_STRING_FIELD
			-- A text field input box with label.
		note
			design: "[
				We have a choice. We can do all this repetitive
				work in the Client or we can do it here (i.e.
				we can do the set_focus_in task).
				
				For now, I am choosing to build this Query routine
				to do all the work.
				]"
		do
			create Result.make_with_caption_and_repeating_pattern (a_text + ": ", '!', "")
			Result.set_select_on_focus_in
		end

end
