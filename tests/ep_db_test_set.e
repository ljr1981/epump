note
	description: "Tests of the EP_DB class"
	testing: "type/manual"
	warning: "[
		This class MUST run in `execution/isolated' (e.g. a private evaluator])!
		
		Why? Other classes will attempt to use the SQLITE3 DB to get their testing
		work done. This class needs to test the EP_DB independent of other classes,
		which means it needs to first delete (prep) the DB and recreate it fresh and
		empty, so it can start from a known point. Facilitating this means deletion
		of the old (prior) DB and then making a new one, filling it in.
		
		See the `on_prepare' below.
		]"
	operation: "[
		The `on_prepare' (below) is commented out. It takes about 150 seconds (2 1/2 minutes)
		to repopulate the data. Because of this computational expense, the code is
		commented out so that running all tests (normally) will not take an
		excessive amount of time. IF the data becomes corrupt or you need to
		otherwise reset it to a baseline of test data, then uncomment the code
		and run the test and then comment it back out afterward.
		]"
	ca_ignore: "CA085"

class
	EP_DB_TEST_SET

inherit
	TEST_SET_SUPPORT
		redefine
			on_prepare
		end

	EP_TEST_SET_BRIDGE
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature {NONE} -- Prep

	on_prepare
			--<Precursor>
		note
			warning: "[
				This entire test depends on having a fresh DB file.
				This means deleting it first and then recreating it
				from scratch each time the test is run.
				]"
		local
--			l_file: PLAIN_TEXT_FILE
			l_db: EP_DB
		do
			Precursor
--				-- Delete it ...
--			create l_file.make_with_name ("epump.sqlite3")
--			if l_file.exists then
--				l_file.delete
--			end
--				-- Make a new one ...
--			create l_db -- creation happens in the `default_create'.
--						-- the `make_empty_from_scratch' in `l_db' also happens!
--			l_db.load_test_data (True)
		end

feature -- Test routines

	ep_db_tests
			-- New test routine
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
		do
			create l_db
			l_db.do_nothing -- Avoids CA020
		end

	ep_db_is_pump_in_db_tests
			--
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
			l_pump: EP_PUMP
		do
			create l_db

			create l_pump.make ("CFAMT04X", "DTLR", "iQ40")
			assert_booleans_equal ("is_pump_in_db_real", True, l_db.is_pump_in_db (l_pump))

			create l_pump.make ("BLAH", "DTLR", "iQ40")
			assert_booleans_equal ("is_pump_in_db_blah", False, l_db.is_pump_in_db (l_pump))

		end

	ep_db_add_new_pump_tests
			-- Ensure we add a new pump and silently swallow dupes.
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
			l_pump: EP_PUMP
		do
			create l_db

			create l_pump.make ("CFAMT04X", "DTLR", "iQ40")
			l_db.add_new_pump (l_pump, agent do_nothing)
		end

	ep_db_delete_pump_with_data_tests
			-- Ensure an inserted pump is successfully deleted.
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
			l_pump: EP_PUMP
		do
			create l_db

			create l_pump.make ("tool", "chamber", "model")
			l_db.add_new_pump (l_pump, agent do_nothing)
			l_db.delete_pump_with_data (l_pump, agent do_nothing)
		end

	ep_db_pump_count_test
			-- test pump count
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
		do
			create l_db
			assert_booleans_equal ("has_pumps", True, l_db.has_pumps)
			assert_integers_equal ("pump_count", 138, l_db.pump_count)
		end

	ep_db_pump_pk_list_test
			-- do we have a list of pumps?
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
			l_list: ARRAYED_LIST [INTEGER]
		do
			create l_db
			l_list := l_db.pump_pk_list
			assert_booleans_equal ("has_pumps", True, l_db.has_pumps)
			assert_integers_equal ("list_count", 138, l_list.count)
		end

	ep_db_all_pumps_test
			-- do we have a list of pumps?
		note
			testing: "execution/serial"
		local
			l_db: EP_DB
			l_list: ARRAYED_LIST [EP_PUMP]
			l_pump: EP_PUMP
		do
			create l_db
			l_list := l_db.all_pumps
			assert_booleans_equal ("has_pumps", True, l_db.has_pumps)
			assert_integers_equal ("list_count", 138, l_list.count)

			l_pump := l_list.i_th (1)
			assert_strings_equal ("pump_1", "CFAMT01X-A-80/500", l_pump.key)
			assert_integers_equal ("exhaust_count", 4, l_pump.exhaust_data.count)
			assert_integers_equal ("temperature_count", 4, l_pump.temperature_data.count)
		end

end


