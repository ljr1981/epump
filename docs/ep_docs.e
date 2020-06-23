note
	description: "System Documentation Class"

class
	EP_DOCS

note
	bnfe_structure: "[

		Program_structure ::=
			Data_tier				-- Where everything data is handled.
			Business_tier			-- Where all non-GUI and non-data computation and logic is at.
			Presentation_tier		-- Where all GUI-presentation components are at.
			
		----------- Tier Stuff ----------------
		
		Data_tier ::=
			{EP_DB}					-- Primary access to SQLite3 Database.
			{EP_TEST_DATA}			-- Used this in the beginning to get data to work with.
		
		Business_tier ::=
			Common_business			-- System-wide common business-tier classes
			{EP_EVALUATOR}			-- What evaluates {EP_PUMP} imminent/potential hazard lists.

		Presentation_tier ::=
			{EP_APP}				-- The main GUI application (starts at the `make').
			{EP_MAIN_WINDOW}		-- The primary (main) window for the application.
			{EP_MAIN_MENU_BAR}		-- The primary window Menu.
			Images					-- System-wide images (e.g. PNGs).
			Grids					-- System-wide common grid components.
			Components				-- System-wide common GUI components.
			Dialogs					-- System-wide common dialogs (print, color, message, info, etc.).
			Toolbars				-- System-wide common toolbars for windows.
			Extensions				-- Classes operating as enhancements of classes from other libraries.
			
		------------ Common Stuff ---------------
		
		Common_business ::=
			{EP_ANY}				-- Program-wide features (e.g. logging access).
			{EP_CONSTANTS}			-- Program-wide constant variables (e.g. db-name, statuses, etc).
		
		------------- Presentation Stuff --------------
		
		Images ::=
			{IMG_*}					-- All image classe are prefixed with "IMG_"
			
		Grids ::=
			{EP_GRID_FACTORY}		-- A Factory class responsible for building Grid components.
			{EP_PUMP_GRID}			-- A common grid filled with pumps and their data.
			
		Components ::=
			{EP_WIDGET}				-- The basis for all common GUI components.
			
		Dialogs ::=
			[no_dialog_classes_yet]	-- There are no examples of dialogs just yet (there will be).
		
		Toolbars ::=
			[no_toolbars_yet]		-- There are no examples of toolbars just yet (there will be).
			
		Extensions ::=
			{EV_GRID_EXT}			-- An enhancement of the {EV_GRID} component.
			{EV_STOCK_COLORS_EXT}	-- A class with lots of different "colors" by name.
										(so we don't have to make colors based on RGB values only)

		]"

end
