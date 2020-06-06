note
	description: "An Evaluator of {EP_PUMP} items."

class
	EP_EVALUATOR

inherit
	EP_ANY

feature -- Access: Exhaust-based

	imminent_exhaust_hazard_list (a_pumps: ARRAY [EP_PUMP]): HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
			-- A list of imminent hazard pumps derived from `a_pumps' list.
		do
			create Result.make (a_pumps.count)
			across
				a_pumps as ic
			loop
				if ic.item.average_exhuast_delta > Imminent_exhaust_rate_failure_threshhold then
					Result.force ([ic.item, Exhaust_rate_code], ic.item.key + "-" + Exhaust_rate_code)
				end
				if ic.item.average_exhuast_delta > Imminent_pressure_level_failure_threshhold then
					Result.force ([ic.item, Pressure_level_code], ic.item.key + "-" + Pressure_level_code)
				end
			end
		end

	imminent_exhaust_rate_failure_list (a_pumps: ARRAY [EP_PUMP]): HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
			-- A list of `Exhaust_rate_code' imminent failure pumps.
		do
			create Result.make (a_pumps.count)
			across
				imminent_exhaust_hazard_list (a_pumps) as ic
			loop
				if ic.item.t_code = Exhaust_rate_code then
					Result.force (ic.item, ic.key)
				end
			end
		end

	imminent_pressure_level_failure_list (a_pumps: ARRAY [EP_PUMP]): HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
			-- A list of `Pressure_level_code' imminent failure pumps.
		do
			create Result.make (a_pumps.count)
			across
				imminent_exhaust_hazard_list (a_pumps) as ic
			loop
				if ic.item.t_code = Pressure_level_code then
					Result.force (ic.item, ic.key)
				end
			end
		end

	potential_exhaust_hazard_list (a_pumps: ARRAY [EP_PUMP]): HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
			-- A list of potential hazard pumps derived from `a_pumps' list.
		do
			create Result.make (a_pumps.count)
			across
				a_pumps as ic
			loop
				if ic.item.average_exhuast_delta > Potential_exhaust_rate_failure_threshhold then
					Result.force ([ic.item, Exhaust_rate_code], ic.item.key + "-" + Exhaust_rate_code)
				end
				if ic.item.average_exhuast_delta > Potential_pressure_level_failure_threshhold then
					Result.force ([ic.item, Pressure_level_code], ic.item.key + "-" + Pressure_level_code)
				end
			end
		end

	potential_exhaust_rate_failure_list (a_pumps: ARRAY [EP_PUMP]): HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
			-- A list of `Exhaust_rate_code' potential failure pumps.
		do
			create Result.make (a_pumps.count)
			across
				potential_exhaust_hazard_list (a_pumps) as ic
			loop
				if ic.item.t_code = Exhaust_rate_code then
					Result.force (ic.item, ic.key)
				end
			end
		end

	potential_pressure_level_failure_list (a_pumps: ARRAY [EP_PUMP]): HASH_TABLE [TUPLE [t_pump: EP_PUMP; t_code: STRING], STRING]
			-- A list of `Pressure_level_code' potential failure pumps.
		do
			create Result.make (a_pumps.count)
			across
				potential_exhaust_hazard_list (a_pumps) as ic
			loop
				if ic.item.t_code = Pressure_level_code then
					Result.force (ic.item, ic.key)
				end
			end
		end

end
