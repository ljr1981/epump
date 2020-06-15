note
	description: "Demonstration of {EV_GRID_EXT}"
	testing: "type/manual"

class
	EP_PUMP_GRID_TEST_SET

inherit
	TEST_SET_SUPPORT_VISION2

feature -- Test routines

	view_data_in_grid_test
			--
		local
			l_grid: EV_GRID_EXT
		do
			l_grid := data_grid


			show_me := True
			demonstrate_widget (l_grid)
		end

feature {NONE} -- Factories

	data_grid: EV_GRID_EXT
			--
		local
			l_checkable: EV_GRID_CHECKABLE_LABEL_ITEM
			l_choice: EV_GRID_CHOICE_ITEM
			l_combo: EV_GRID_COMBO_ITEM
			l_drawable: EV_GRID_DRAWABLE_ITEM
			l_editable: EV_GRID_EDITABLE_ITEM
			l_label: EV_GRID_LABEL_ITEM
			l_pix_right: EV_GRID_PIXMAPS_ON_RIGHT_LABEL_ITEM
			i: INTEGER
			l_pump: EP_PUMP
		do
			create Result
			Result.enable_row_colorizing
			Result.enable_enter_key_tabbing
			Result.set_minimum_size (575, 500)

				-- Load Pump data to GUI
			across
				db.all_pumps as ic
			from
				i := 1
			loop
				l_pump := ic.item

				create l_label.make_with_text (i.out)
				Result.set_item (1, i, l_label)
				Result.column (1).set_width (25)
				Result.set_item (2, i, create {EV_GRID_LABEL_ITEM}.make_with_text (l_pump.tool))
				Result.set_item (3, i, create {EV_GRID_LABEL_ITEM}.make_with_text (l_pump.chamber))
				Result.set_item (4, i, create {EV_GRID_LABEL_ITEM}.make_with_text (l_pump.model))
					-- Last exhaust value (if any)
				create l_label.make_with_text (l_pump.latest_exhaust_value.out)
				l_label.align_text_right
				Result.set_item (5, i, l_label)
				Result.column (5).set_width (65)
					-- Last exhaust date (if any)
				if attached l_pump.latest_exhaust_date as al_date then
					Result.set_item (6, i, create {EV_GRID_LABEL_ITEM}.make_with_text (al_date.out))
				else
					Result.set_item (6, i, create {EV_GRID_LABEL_ITEM}.make_with_text ("n/a"))
				end
					-- Last temperature value (if any)
				create l_label.make_with_text (l_pump.latest_temperature_value.out)
				l_label.align_text_right
				Result.set_item (7, i, l_label)
				Result.column (7).set_width (65)
					-- Last temperature date (if any)
				if attached l_pump.latest_temperature_date as al_date then
					Result.set_item (8, i, create {EV_GRID_LABEL_ITEM}.make_with_text (al_date.out))
				else
					Result.set_item (8, i, create {EV_GRID_LABEL_ITEM}.make_with_text ("n/a"))
				end

				i := i + 1
			end
			Result.column (1).header_item.set_text ("#")
			Result.column (2).header_item.set_text ("Tool")
			Result.column (3).header_item.set_text ("Chamber")
			Result.column (4).header_item.set_text ("Model")
			Result.column (5).header_item.set_text ("Last Exh")
			Result.column (6).header_item.set_text ("Exh Date")
			Result.column (7).header_item.set_text ("Last Temp")
			Result.column (8).header_item.set_text ("Temp Date")
		end

feature {NONE} -- Database

	db: EP_DB
			-- Database access
		once ("OBJECT")
			create Result
		end

end
