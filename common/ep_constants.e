note
	description: "Constants applied to System"

class
	EP_CONSTANTS

feature {NONE} -- Implementation: Constants

	second_item_const: INTEGER = 2

	Imminent_exhaust_rate_failure_threshhold: REAL = 0.5
	Imminent_pressure_level_failure_threshhold: REAL = 6.0

	Potential_exhaust_rate_failure_threshhold: REAL = 0.2
	Potential_pressure_level_failure_threshhold: REAL = 3.5

	Exhaust_rate_code: STRING = "EXHAUST_RATE"
	Pressure_level_code: STRING = "PRESSURE_LEVEL"

end
