note
	description: "System Documentation Class"

class
	EP_DOCS

note
	bnfe_structure: "[

		BNFE						-- Description (Priority #) "!" = Done.
		------------------------	-------------------------------------------------------------
		Program_structure ::=
			Data_tier				-- (#1) Where everything data is handled.
			Business_tier			-- (#1) Where all non-GUI and non-data computation and logic is at.
			Presentation_tier		-- (#1) Where all GUI-presentation components are at.
			Libraries				-- (#1) Libraries of code for specific purposes.
			
		----------- Tier Stuff ----------------
		BNFE						-- Description (Priority #) "!" = Done.
		------------------------	-------------------------------------------------------------
		
		Data_tier ::=
			{EP_DB}					-- (#1) Primary access to SQLite3 Database.
			{EP_TEST_DATA}			-- (#1) Used this in the beginning to get data to work with.
		
		Business_tier ::=
			Common_business			-- (#1) System-wide common business-tier classes
			{EP_EVALUATOR}			-- (#1) What evaluates {EP_PUMP} imminent/potential hazard lists.

		Presentation_tier ::=
			{EP_APP}				-- (#1) The main GUI application (starts at the `make').
			{EP_MAIN_WINDOW}		-- (#1) The primary (main) window for the application.
			{EP_MAIN_MENU_BAR}		-- (#1) The primary window Menu.
			Images					-- (#1) System-wide images (e.g. PNGs).
			Grids					-- (#1) System-wide common grid components.
			Components				-- (#1) System-wide common GUI components.
			Dialogs					-- (#1) System-wide common dialogs (print, color, message, info, etc.).
			Toolbars				-- (#2) System-wide common toolbars for windows.
			Extensions				-- (#1) Classes operating as enhancements of classes from other libraries.
			
		------------ Common Stuff ---------------
		BNFE						-- Description (Priority #) "!" = Done.
		------------------------	-------------------------------------------------------------
		
		Common_business ::=
			{EP_ANY}				-- (#1) Program-wide features (e.g. logging access).
			{EP_CONSTANTS}			-- (#1) Program-wide constant variables (e.g. db-name, statuses, etc).
		
		------------- Presentation Stuff --------------
		BNFE						-- Description (Priority #) "!" = Done.
		------------------------	-------------------------------------------------------------
		
		Images ::=
			{IMG_*}					-- (#1) All image classe are prefixed with "IMG_"
			
		Grids ::=
			{EP_GRID_FACTORY}		-- (#1) A Factory class responsible for building Grid components.
			{EP_PUMP_GRID}			-- (#1) A common grid filled with pumps and their data.
			
		Components ::=
			{EP_WIDGET}				-- (#1) The basis for all common GUI components.
			
		Dialogs ::=
			[no_dialog_classes_yet]	-- (#1) There are no examples of dialogs just yet (there will be).
		
		Toolbars ::=
			[no_toolbars_yet]		-- (#2) There are no examples of toolbars just yet (there will be).
			
		Extensions ::=
			{EV_GRID_EXT}			-- (#1) An enhancement of the {EV_GRID} component.
			{EV_STOCK_COLORS_EXT}	-- (#1) A class with lots of different "colors" by name.
										(so we don't have to make colors based on RGB values only)
		
		------------- Library Dependencies --------------
		BNFE						-- Description (Priority #) "!" = Done.
		------------------------	-------------------------------------------------------------
		
		Libraries ::=
			Data_libraries			-- (!) Libraries dedicated to working with data/databases/repositories.
			Business_libraries		-- (!) Libraries dedicated to processing.
			GUI_libraries			-- (!) Libraries dedicated to GUI presenations.
			In_progress_libraries	-- (#2) Libraries currently in-progress of design/implement/test/deliver.
			
		Data_libraries ::=
			Sqlite					-- (!) Allows working with SQLite-3 databases.
			Sqlite_ext				-- (!) Enhancements to Sqlite library.
			
		Business_libraries ::=
			base					-- (!) All base structures (e.g. arrays, lists, math functions, etc.).
			diff					-- (!) Computing of differences between things (e.g. like strings).
			preferences				-- (!) System-wide preferences and their storage in XML (conf) files.
			testing					-- (!) Classes used by AutoTest for writing *_TEST_SET classes.
			time					-- (!) Date, Time, and Data-time related data and computations.
		
		GUI_libraries ::=
			mask					-- (!) Applies "masking" to Vision2 {EV_TEXT_FIELD} classes.
			vision2					-- (!) Stanard Windows/Linux GUI components and supporting classes.
			vision2_extension		-- (!) Enhancements to Vision2.
			
		In_progress_libraries ::=
			svg_graph				-- (#2) A generic/common SVG graphing/drawing library.
										(* Generate SVG vector drawings, graphs, reports, and generate
											PNG files from the SVG).

		]"
	items_to_do: "[
		A list of to-do items that may or may not represent the larger
		scope-of-work remaining. There may be more of these lurking that
		will only be discovered as the need arises. Conversely, not all
		the items on this list will ever be built. Needs of the program
		will dictate all.
		
		TO DO LIST					-- Description (Priority #) "!" = Done.
		==========					-------------------------------------------------------------
		Import_export ::=
			Json_import_export		-- (#3) Import/Export of data to/from JSON.
			CSV_import_export		-- (#3) Import/Export of data to/from CSV.
			XML_import				-- (#2) Import of data from XML.
		
		Data_entry ::=
			Pump_inserting			-- (#1) Inserting new (unique) pumps into DB.
			Pump_updating			-- (#1) Updating existing pumps in DB.
			Pump_archiving			-- (#2) Archive and restore existing pumps to archival DB.
			Pump_deleting			-- (#2) Deletion (permanent) of Archived pumps.

		Facilities ::=
			Log viewer				-- (#2) GUI Log Viewer w/clearing & filtering.
			Log_clearer				-- (#2) Facility to clear system.log file (completely).
			Log_filterer			-- (#2) Facility to remove certain log items from system.log (permanent).
			Email_faclities			-- (#1) Email facilities for standard emails and emails w/attachments.
			SVG_facilities			-- (#2) Facility to create various SVG vector drawings (i.e. charts, etc).

		Reports ::=
			Pump_evaluator_GUI		-- (#1) GUI facility over {EP_EVALUATOR}.
			Evaluation_reports		-- (#1) Report(s) based on {EP_EVALUATOR} results.
			Data_graphs_reports		-- (#2) SVG-based reports.
		]"


end
