note
	description: "Demonstration of {EV_GRID_EXT}"
	testing: "type/manual"

class
	EP_PUMP_GRID_TEST_SET

inherit
	TEST_SET_SUPPORT_VISION2

feature -- Test routines

	view_data_in_grid_test
			-- Demonstrate the pump grid
		note
			EIS: "name=demo_video", "src=https://youtu.be/n3u_hQ4Et2g"
		do
			show_me := True
			demonstrate_widget ( (create {EP_PUMP_GRID}.make_with_pumps (db.all_pumps.to_array)).widget )
		end

feature {NONE} -- Factories

	-- Move factories to classes ASAP!

feature {NONE} -- Database

	db: EP_DB
			-- Database access
		once ("OBJECT")
			create Result
		end

end
