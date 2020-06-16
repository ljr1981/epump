note
	description: "A grid presenting pumps"

class
	EP_PUMP_GRID

inherit
	EP_WIDGET [EV_GRID_EXT]

create
	make_with_pumps

feature {NONE} -- Initialization

	make_with_pumps (a_pumps: ARRAY [EP_PUMP])
			-- Initialize Current with an array of `a_pumps'.
		local
			l_factory: EP_GRID_FACTORY
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
			create l_factory
			widget := l_factory.grid_ext
			widget.enable_row_colorizing
			widget.enable_enter_key_tabbing
			widget.set_minimum_size (575, 500)

				-- Load Pump data to GUI
			across
				a_pumps as ic
			from
				i := 1
			loop
				l_pump := ic.item

				create l_label.make_with_text (i.out)
				widget.set_item (1, i, l_label)
				widget.column (1).set_width (25)
				l_label.select_actions.extend (agent on_row_select (widget.row (i)))

				widget.set_item (2, i, create {EV_GRID_LABEL_ITEM}.make_with_text (l_pump.tool))

				widget.set_item (3, i, create {EV_GRID_LABEL_ITEM}.make_with_text (l_pump.chamber))

				widget.set_item (4, i, create {EV_GRID_LABEL_ITEM}.make_with_text (l_pump.model))
					-- Last exhaust value (if any)
				create l_label.make_with_text (l_pump.latest_exhaust_value.out)
				l_label.align_text_right
				widget.set_item (5, i, l_label)
				widget.column (5).set_width (65)
					-- Last exhaust date (if any)
				if attached l_pump.latest_exhaust_date as al_date then
					widget.set_item (6, i, create {EV_GRID_LABEL_ITEM}.make_with_text (al_date.out))
				else
					widget.set_item (6, i, create {EV_GRID_LABEL_ITEM}.make_with_text ("n/a"))
				end
					-- Last temperature value (if any)
				create l_label.make_with_text (l_pump.latest_temperature_value.out)
				l_label.align_text_right
				widget.set_item (7, i, l_label)
				widget.column (7).set_width (65)
					-- Last temperature date (if any)
				if attached l_pump.latest_temperature_date as al_date then
					widget.set_item (8, i, create {EV_GRID_LABEL_ITEM}.make_with_text (al_date.out))
				else
					widget.set_item (8, i, create {EV_GRID_LABEL_ITEM}.make_with_text ("n/a"))
				end

				i := i + 1
			end
			widget.column (1).header_item.set_text ("#")
			widget.column (2).header_item.set_text ("Tool"); set_selection (2)
			widget.column (3).header_item.set_text ("Chamber"); set_selection (3)
			widget.column (4).header_item.set_text ("Model"); set_selection (4)
			widget.column (5).header_item.set_text ("Last Exh"); set_selection (5)
			widget.column (6).header_item.set_text ("Exh Date"); set_selection (6)
			widget.column (7).header_item.set_text ("Last Temp"); set_selection (7)
			widget.column (8).header_item.set_text ("Temp Date"); set_selection (8)
		end

	set_selection (a_col: INTEGER)
		do
			widget.column (a_col).header_item.pointer_button_press_actions.extend (agent on_col_header_item_select (?, ?, ?, ?, ?, ?, ?, ?, widget.column (a_col), a_col))
		end

	on_col_header_item_select (i1, i2, i3: INTEGER; r1, r2, r3: REAL_64; i4, i5: INTEGER; a_col: EV_GRID_COLUMN; a_column_number: INTEGER)
			--
		do
			if a_col.is_selected then
				widget.column_deselect_actions.call (a_col)
				a_col.disable_select
			else
				widget.select_column (a_column_number)
				a_col.enable_select
			end
		end

	on_row_select (a_row: EV_GRID_ROW)
			--
		do
			a_row.toggle
		end

end
