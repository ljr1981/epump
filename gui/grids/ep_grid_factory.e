note
	description: "A Factory that make Grid things."

class
	EP_GRID_FACTORY

inherit
	EV_STOCK_COLORS_EXT

feature -- Access: Grids

	grid_ext: EV_GRID_EXT
			-- Create a new grid
		note
			design: "[
				For now, we are not:
				
				1. Overscrolling (Result.enable_vertical_overscroll)
					- We want the grid to scroll to the bottom, but not
						into "blank space" because there is no need.
				]"
		do
			create Result
			Result.mouse_wheel_actions.extend (agent on_mouse_wheel (?, Result))
			Result.vertical_scroll_bar.mouse_wheel_actions.extend (agent on_mouse_wheel (?, Result))
			Result.enable_row_colorizing
			Result.enable_enter_key_tabbing
		end

feature -- Basic Operations: Grid

	on_mouse_wheel (a_direction: INTEGER; a_grid: EV_GRID_EXT)
			-- What happens on mouse wheel move?
		do
			if up (a_direction) then
				a_grid.vertical_scroll_bar.leap_backward
			else
				a_grid.vertical_scroll_bar.leap_forward
			end
		end

	up (a_direction: INTEGER): BOOLEAN
			-- Is the `a_direction' `up'?
		do
			Result := a_direction > 0
		end

feature -- Access: Temp Grid

	target_grid: detachable like grid_ext
	attached_target_grid: attached like target_grid do check attached target_grid as al_result then Result := al_result end end
			-- Attached version of `target_grid'.

	set_target_grid (a_grid: like target_grid) do target_grid := grid_ext end
			-- Set `target_grid' to `a_grid'.

	reset_target_grid,
	clear_target_grid do target_grid := Void end
			-- Reset or Clear `target_grid' to Void.

	set_grid_item (a_item: EV_GRID_ITEM; a_col, a_row: INTEGER)
			-- Set `a_item' at `a_col'/`a_row' into `target_grid'
		do
			attached_target_grid.set_item (a_col, a_row, a_item)
			last_item := a_item
		ensure
			has_col: attached_target_grid.column_count >= a_col
			has_row: attached_target_grid.row_count >= a_row
			last_item_set: attached last_item as al_item and then al_item ~ a_item
		end

	last_item: detachable EV_GRID_ITEM
	attached_last_item: attached like last_item do check attached last_item as al_result then Result := al_result end end
	attached_last_label: EV_GRID_LABEL_ITEM do check attached {EV_GRID_LABEL_ITEM} last_item as al_result then Result := al_result end end

feature -- Access: Labels

	set_grid_label (a_text: STRING; a_col, a_row: INTEGER)
			-- Set a plain `grid_label'.
		do
			set_grid_item (create {EV_GRID_LABEL_ITEM}.make_with_text (a_text), a_col, a_row)
		ensure
			has_col: attached_target_grid.column_count >= a_col
			has_row: attached_target_grid.row_count >= a_row
		end

	set_grid_label_with_width (a_text: STRING; a_col, a_row, a_width: INTEGER)
			-- Set a plain `grid_label_with_width'
		do
			check attached (create {EV_GRID_LABEL_ITEM}.make_with_text (a_text)) as al_label then
				set_grid_item (al_label, a_col, a_row)
				attached_target_grid.column (a_col).set_width (a_width)
			end
		ensure
			has_col: attached_target_grid.column_count >= a_col
			has_row: attached_target_grid.row_count >= a_row
		end

end
