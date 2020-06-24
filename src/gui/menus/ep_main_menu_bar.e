note
	description: "Notion of a Main Menu Bar for Main Window"
	EIS: "src=https://www.eiffel.org/doc/solutions/Items"

	structure: "[
		EV_WINDOW accepts items of type (use set_menu_bar):
			EV_MENU_BAR accepts items of type:
				EV_MENU accepts items of type:
					EV_MENU
					EV_MENU_ITEM
					EV_MENU_SEPARATOR
					EV_RADIO_MENU_ITEM
					EV_CHECK_MENU_ITEM
		]"

class
	EP_MAIN_MENU_BAR

inherit
	EV_MENU_BAR

create
	make

feature {NONE} -- Initialization

	make (a_window: EP_MAIN_WINDOW)
			-- Initialize Current.
		do
			default_create
			extend (file)
			file.extend (file_new (a_window))
			file.extend (create {EV_MENU_SEPARATOR})
			file.extend (File_preferences (a_window))
			file.extend (create {EV_MENU_SEPARATOR})
			file.extend (file_exit (a_window))
		end

feature -- Menu Elements

	file: EV_MENU
			-- Main window File menu.
		once
			create Result.make_with_text ("&File")
		end

	file_exit (a_window: EP_MAIN_WINDOW): EV_MENU_ITEM
			-- Main window File -> Exit menu.
		once
			create Result.make_with_text_and_action ("E&xit", agent on_file_exit_click (a_window))
		end

	file_new (a_window: EP_MAIN_WINDOW): EV_MENU_ITEM
			-- Main window File -> New menu.
		once
			create Result.make_with_text_and_action ("&New", agent on_file_new_click (a_window))
		end

	file_preferences (a_window: EP_MAIN_WINDOW): EV_MENU_ITEM
			--
		once
			create Result.make_with_text_and_action ("&Preferences", agent on_file_preferences (a_window))
		end

feature -- Event Operations

	on_file_exit_click (a_window: EP_MAIN_WINDOW)
			-- What happens when the File -> Exit menu item is clicked?
		do
			a_window.destroy_and_exit_if_last
		end

	on_file_new_click (a_window: EP_MAIN_WINDOW)
			-- What happens when the File -> New menu item is clicked?
		local
			l_new_pumps: EP_NEW_PUMPS_WINDOW
		do
			create l_new_pumps.make_with_title ("Add new pumps")
			l_new_pumps.show_relative_to_window (a_window)
		end

	on_file_preferences (a_window: EP_MAIN_WINDOW)
			-- What happens when the File -> Preferences menu itme is clicked?
		local
			l_pref_window: PREFERENCES_WINDOW
		do
			create l_pref_window.make (a_window.prefs, a_window)
			l_pref_window.show
		end

end
