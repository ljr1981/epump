note
	description: "A Factory that make Grid things."

class
	EP_GRID_FACTORY

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

feature -- Access: Grid Components



end
