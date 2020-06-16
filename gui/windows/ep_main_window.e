note
	description: "EP Main Window"
	preliminary_design: "See end of class notes"

class
	EP_MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize
		end

create
	make_with_title

feature {NONE} -- Initialization

	create_interface_objects
			--<Precursor>
		do
			Precursor
			create main_box
			create pump_grid.make_with_pumps (db.all_pumps.to_array)
		end

	initialize
			--<Precursor>
		do
			Precursor
			create eval
				-- GUI
			extend (main_box)
			main_box.extend (pump_grid.widget)
			set_icon_pixmap ( (create {IMG_DOCUMENTATION}.make).to_pixmap )
		end

feature {NONE} -- Widgets

	main_box: EV_VERTICAL_BOX

	pump_grid: EP_PUMP_GRID
			-- A grid for displaying pumps

feature {NONE} -- Implementation

	db: EP_DB
			-- Database of Current Window.
		once
			create Result
		end

	eval: EP_EVALUATOR
			-- Pump Evaluator of Current Window.

;note
	BNFE: "[
		Main_window ::=
			Main_menu
			Main_toolbar
			Main_box
			
		Main_menu ::=
			File_menu
			Edit_menu
			Help_menu
			About_menu
			
		Main_toolbar ::=
			File_tools
			Edit_tools
			Help_button
			About_button
			
		Main_box ::=
			<<ALL the stuff needed by the GUI in the main window>>
		]"
	preliminary_design: "[

		]"

end
