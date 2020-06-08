note
	description: "Tests of the EP_DB class"
	testing: "type/manual", "execution/isolated"
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

class
	EP_DB_TEST_SET

inherit
	TEST_SET_SUPPORT
		redefine
			on_prepare
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
			l_file: PLAIN_TEXT_FILE
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
		local
			l_db: EP_DB
		do
			create l_db
		end

end


