note
	description: "EP Main Window"
	preliminary_design: "See end of class notes"

class
	EP_MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			make_with_title,
			create_interface_objects,
			initialize
		end

	EP_ANY
		undefine
			copy,
			default_create
		end

create
	make_with_title

feature {NONE} -- Initialization

	make_with_title (a_title: READABLE_STRING_GENERAL)
			--<Precursor>
		note
			why_am_i_here: "[
				Placing the call to `set_menu_bar' in either the
				`create_interface_objects' or `initialize' causes
				the following "ensure then" to fail in the
				`default_create' of {EV_WINDOW} (called by Precursor
				below). So, to handle this ensure properly, we
				must place the menu bar setting here so we do
				not violate the conract.
				
				is_in_default_state: is_in_default_state
				]"
		do
			initialize_preferences
			Precursor (a_title)
			set_menu_bar (create {EP_MAIN_MENU_BAR}.make (Current))
		end

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

	initialize_preferences
			-- Initialize the preferences of Current.
		note
			design: "[
				The most important line is the `log_info' call. Why?
				The log info call reaches out to get the `log_level'
				as set in the preferences and ensures it endures throughout
				the applications life.
				
				Otherwise—be sure to set up as many application-wide
				preferences as you need to at this level. You can read
				and utilize preferences at any time, but this is the
				place to initialize them!
				]"
		do
			if attached {INTEGER_PREFERENCE} prefs.get_preference ("debug.log_level") as al_log_level then
				set_log_level (al_log_level.value)
			end
			log_info (create {ANY}, "start_up") -- Logging startup ensure that the `logger'
												-- gets the right log_level.
		end

feature -- Access

	prefs: PREFERENCES
			-- The preferences for Current Application
		local
			l_storage: PREFERENCES_STORAGE_XML
				-- Factory & Manager(s)
			l_factory: GRAPHICAL_PREFERENCE_FACTORY		-- Factory to create Prefs for Mgrs
			l_manager: PREFERENCE_MANAGER				-- A Manager responsible for each pref domain

			l_log_level_pref: INTEGER_PREFERENCE
		once
			create l_storage.make_with_location ("epump.conf")
			create Result.make_with_defaults_and_storage (<<"defaults.conf">>, l_storage)
			create l_factory

				-- debug.log_level
			l_manager := prefs.new_manager ("debug")
			l_log_level_pref := l_factory.new_integer_preference_value (l_manager, "debug.log_level", 7)
			l_log_level_pref.set_description ("1 EMERG < 2 ALERT < 3 CRIT < 4 ERROR < 5 WARN < 6 NOTIC < 7 INFO < 8 DEBUG")
			Result.save_preference (l_log_level_pref)

			Result.set_save_defaults (True)
			Result.save_preferences
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
