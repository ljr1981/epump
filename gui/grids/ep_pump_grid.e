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
			i: INTEGER
			l_pump: EP_PUMP
--			l_checkable: EV_GRID_CHECKABLE_LABEL_ITEM
--			l_choice: EV_GRID_CHOICE_ITEM
--			l_combo: EV_GRID_COMBO_ITEM
--			l_drawable: EV_GRID_DRAWABLE_ITEM
--			l_editable: EV_GRID_EDITABLE_ITEM
--			l_label: EV_GRID_LABEL_ITEM
--			l_pix_right: EV_GRID_PIXMAPS_ON_RIGHT_LABEL_ITEM
		do
			create l_factory
			l_factory.set_target_grid (l_factory.grid_ext)
			widget := l_factory.attached_target_grid

			widget.set_minimum_size (575, 500)

				-- Load Pump data to GUI
			across
				a_pumps as ic
			from
				i := 1
			loop
				l_pump := ic.item
					-- # Column
				l_factory.set_grid_label_with_width (i.out, 1, i, 25)
				l_factory.attached_last_item.select_actions.extend (agent on_row_select (widget.row (i)))
					-- Tool, Chamber, Model
				l_factory.set_grid_label (l_pump.tool, 2, i)
				l_factory.set_grid_label (l_pump.chamber, 3, i)
				l_factory.set_grid_label (l_pump.model, 4, i)
					-- Last exhaust value (if any)
				l_factory.set_grid_label_with_width (l_pump.latest_exhaust_value.out, 5, i, 65)
				l_factory.attached_last_label.align_text_right
					-- Last exhaust date (if any)
				if attached l_pump.latest_exhaust_date as al_date then
					l_factory.set_grid_label_with_width (al_date.out, 6, i, 65)
				else
					l_factory.set_grid_label_with_width ("n/a", 6, i, 65)
				end
					-- Last temperature value (if any)
				l_factory.set_grid_label_with_width (l_pump.latest_exhaust_value.out, 7, i, 65)
				l_factory.attached_last_label.align_text_right
					-- Last temperature date (if any)
				if attached l_pump.latest_temperature_date as al_date then
					l_factory.set_grid_label_with_width (al_date.out, 8, i, 65)
				else
					l_factory.set_grid_label_with_width ("n/a", 8, i, 65)
				end

				i := i + 1
			end
			across
				<<"#", "Tool", "Chamber", "Model", "Last Exh", "Exh Date", "Last Temp", "Temp Date">> as ic
			loop
				widget.column (ic.cursor_index).header_item.set_text (ic.item)
				if ic.cursor_index > 1 then
					set_selection (ic.cursor_index)
				end
			end

			l_factory.clear_target_grid
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
