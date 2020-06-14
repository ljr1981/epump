note
	description: "A grid presenting pumps"

class
	EP_PUMP_GRID

inherit
	EP_WIDGET [JV_GRID]

create
	make

feature {NONE} -- Initialization

	make
			--
		do
			create widget
			widget.enable_row_colorizing
		end

feature -- Settings

	add_pumps (a_pumps: ARRAY [EP_PUMP])
			--
		do
			across
				a_pumps as ic
			loop

			end
		end

end
