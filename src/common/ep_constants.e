note
	description: "Constants applied to System"

expanded class
	EP_CONSTANTS

feature {NONE} -- Implementation: Constants

	Second_item_const: INTEGER = 2
			-- Representation of a second item (perhaps in a list).

	Imminent_exhaust_rate_failure_threshhold: REAL = 0.5
	Imminent_pressure_level_failure_threshhold: REAL = 6.0
			-- Imminent exhaust and pressure levels for testing purposes.

	Potential_exhaust_rate_failure_threshhold: REAL = 0.2
	Potential_pressure_level_failure_threshhold: REAL = 3.5
			-- Potential exhaust and pressure levels for testing purposes.

	Exhaust_rate_code: STRING = "EXHAUST_RATE"
	Pressure_level_code: STRING = "PRESSURE_LEVEL"
			-- Code constants for exhaust and pressure.

feature -- Constants

	DB_file_name: STRING = "epump.sqlite3"
			-- What to call the DB for this app.

	Column_one_const: NATURAL_32 = 1
			-- Representing notion of first column.

	Column_two_const: NATURAL_32 = 2
			-- Representing notion of second column.

	Column_three_const: NATURAL_32 = 3
			-- Representing notion of third column.

	Column_four_const: NATURAL_32 = 4
			-- Representing notion of fourth column.

	Column_five_const: NATURAL_32 = 5
			-- Representing notion of fifth column.

	No_pumps: INTEGER = 0
			-- Representing notion of `no_pumps'.

feature -- Statuses

	In_service_status: STRING = "IN-SERVICE"
	In_service_code: INTEGER = 1

	Out_of_service_status: STRING = "OUT-OF-SERVICE"
	Out_of_service_code: INTEGER = 2

	In_repair_status: STRING = "IN-REPAIR"
	In_repair_code: INTEGER = 3

	Service_statuses: ARRAY [STRING]
		once
			Result := <<In_service_status, Out_of_service_status, In_repair_status>>
		end

end
