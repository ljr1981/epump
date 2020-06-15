note
	description: "A Test Support for Vision2 Demonstrations"

class
	TEST_SET_SUPPORT_VISION2

inherit
	TEST_SET_SUPPORT

feature -- Basic Operations

	demonstrate_widget (a_widget: attached like test_item_anchor)
			-- Demonstration of `a_widget' in a window.
		local
			l_app: EV_APPLICATION
			l_window: ET_TS_WINDOW
		do
			if show_me then
				l_window := demo_window (a_widget)

				application.post_launch_actions.extend (agent l_window.show)
				l_window.close_request_actions.extend (agent l_window.destroy_and_exit_if_last)
				l_window.close_request_actions.extend (agent application.destroy)
				l_window.show -- Added this "show" call, otherwise window does not show.

				application.launch
			end
		end

feature -- Status Report

	show_me: BOOLEAN
			-- Change me to True to see widget demo!
			-- Determines if `demonstrate_widget'
			--	shows `demo_window' in `application'.

feature -- Access

	demo_window (a_primitive: attached like test_item_anchor): ET_TS_WINDOW
			-- A window for demonstration of widgets.
		local
			l_box, l_frame_box: EV_VERTICAL_BOX
			l_inner_box, l_inner_frame_box: EV_HORIZONTAL_BOX
			l_box_frame, l_inner_frame, l_primitive_frame: EV_FRAME
		do
			create Result.make_with_title ("Demonstration: " + a_primitive.generating_type)

				-- Inner frame Hbox
			create l_inner_frame.make_with_text ("{EV_HORIZONTAL_BOX}")
			l_inner_frame.set_foreground_color (create {EV_COLOR}.make_with_8_bit_rgb (0, 0, 255))
			create l_inner_frame_box
			l_inner_frame_box.extend (filler_cell_frame)
			create l_primitive_frame.make_with_text ("{" + a_primitive.generating_type + "} widget")
			l_primitive_frame.set_foreground_color (create {EV_COLOR}.make_with_8_bit_rgb (0, 150, 0))
			l_inner_frame_box.extend (l_primitive_frame)
			l_primitive_frame.extend (a_primitive)
			l_primitive_frame.set_border_width (3)
			l_inner_frame_box.extend (filler_cell_frame)
			l_inner_frame_box.set_border_width (3)
			l_inner_frame.extend (l_inner_frame_box)

				-- Inner Hbox
			create l_inner_box
			l_inner_box.extend (l_inner_frame)
			l_inner_box.set_border_width (3)
			l_inner_box.set_padding (3)

				-- Outer Vbox
			create l_box
			create l_frame_box
			create l_box_frame.make_with_text ("{EV_VERTICAL_BOX}")
			l_box_frame.set_foreground_color (create {EV_COLOR}.make_with_8_bit_rgb (0, 0, 255))
			l_frame_box.extend (filler_cell_frame)
			l_frame_box.extend (l_inner_box)
			l_frame_box.extend (filler_cell_frame)
			l_frame_box.set_border_width (3)
			l_frame_box.set_padding (3)
			l_frame_box.disable_item_expand (l_inner_box)
			l_box_frame.extend (l_frame_box)
			l_box.extend (l_box_frame)
			Result.extend (l_box)
			Result.set_size (400, 300)
		end

	test_item_anchor: detachable EV_WIDGET
			-- What type is our core test item?
			-- Alternatively, {EV_PRIMITIVE}?

	filler_cell_frame: EV_FRAME
			-- A frame representing an {EV_CELL} for display.
		local
			l_box: EV_VERTICAL_BOX
		do
			create Result.make_with_text ("{EV_CELL}")
			Result.set_style ({EV_FRAME_CONSTANTS}.Ev_frame_lowered)
			Result.set_foreground_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 0, 0))
			create l_box
			l_box.set_background_color (create {EV_COLOR}.make_with_rgb (50, 50, 50))
			l_box.set_border_width (3)
			l_box.set_padding (3)
			Result.extend (l_box)
			Result.set_border_width (3)
		end

	application: EV_APPLICATION
		once ("OBJECT")
			create Result
		end

feature {NONE} -- GUI Components

	add_item_clicked_me_dialog (a_item: EV_ITEM)
			-- What to show when `a_item' is clicked.
		do
			a_item.pointer_button_press_actions.extend (agent on_click)
		end

	add_clicked_me_dialog (a_primitive: EV_PRIMITIVE)
			-- What to show when a widget is clicked.
		do
			a_primitive.pointer_button_press_actions.extend (agent on_click)
		end

	on_click (i1, i2, i3: INTEGER_32; r1, r2, r3: REAL_64; i4, i5: INTEGER_32)
			-- What happens `on_click' (e.g. pointer_button_press_actions)?
		do
			on_item_click
		end

	on_item_click
			--
		local
			l_dialog: EV_INFORMATION_DIALOG
		do
			create l_dialog.make_with_text ("Clicked!")
			l_dialog.show
		end

end
