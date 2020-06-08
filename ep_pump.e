note
	description: "Representation of a Pump"
	design: "[
		See design notes in the note-clause at the bottom of the class.
		]"
	ca_ignore: "CA029",
				"CA005" --Unneeded object test local	EP_PUMP	246, 16	40

class
	EP_PUMP

inherit
	EP_ANY

create
	make,
	make_from_delimited_string

feature {NONE} -- Initialization

	make (a_tool, a_chamber, a_model: like key)
			-- Initialize from `a_tool', `a_chamber', and `a_model'.
		require
			has_data: not a_tool.is_empty and then
						not a_chamber.is_empty and then
						not a_model.is_empty
		do
			tool := a_tool
			chamber := a_chamber
			model := a_model
		ensure
			tool_set: tool.same_string (a_tool)
			chamber_set: chamber.same_string (a_chamber)
			model_set: model.same_string (a_model)
		end

	make_from_delimited_string (a_data: STRING)
			-- Initialize from a comma-delimited string of 3 items.
		require
			valid_delimited_list: a_data.occurrences (',') = 2
		do
			check attached {LIST [STRING]} a_data.split (',') as al_list and then
						al_list.count = 3
				then
					make (al_list [1], al_list [2], al_list [3])
				end
		end

feature -- Access


	tool: like key
			-- Client code

	chamber: like key
			-- Pump chamber

	model: like key
			-- Pump model

	key: STRING
			-- A `key' comprised of concatenated `tool', `chamber', and `model'.
		do
			Result := tool.twin
			Result.append_character ('-')
			Result.append_string_general (chamber)
			Result.append_character ('-')
			Result.append_string_general (model)
		ensure
			well_formed: Result.has_substring (tool) and then
							Result.has_substring (chamber) and then
							Result.has_substring (model)
		end

	exhaust_data: attached like data_type_anchor
			-- Exhaust data
		attribute
			create Result.make (100)
		end

	temperature_data: attached like data_type_anchor
			-- Temperature data
		attribute
			create Result.make (100)
		end

feature -- Exhaust Queries

	average_exhuast_delta: REAL
			-- Computed `average_exhuast_delta' based on `exhaust_data'.
		do
			Result := exhaust_delta_sum / exhaust_delta_count
		end

	exhaust_delta_sum: REAL
			-- The sum of all deltas between `exhaust_data' items.
		do
			Result := delta_sum (exhaust_data)
		end

	has_exhaust_deltas: BOOLEAN
			-- Does Current `exhaust_data' have deltas?
		do
			Result := delta_count (exhaust_data) > 0
		end

	exhaust_delta_count: INTEGER
			-- How many deltas are in `exhaust_data'?
		do
			Result := delta_count (exhaust_data)
		end

	latest_exhaust_item: like latest_item
			-- The latest `exhaust_data' item.
		do
			Result := latest_item (exhaust_data)
		end

	latest_exhaust_date: detachable DATE
			-- The latest `exhaust_data' item date.
		do
			if attached latest_exhaust_item as al_item then
				Result := al_item.t_date
			end
		end

	latest_exhaust_value: REAL
			-- The latest `exhaust_data' item value.
		do
			if attached latest_exhaust_item as al_item then
				Result := al_item.t_value
			end
		end

feature -- Temperature Queries

	average_temperature_delta: REAL
			-- Computed `average_temperature_delta' based on `temperature_data'.
		do
			Result := temperature_delta_sum / temperature_delta_count
		end

	temperature_delta_sum: REAL
			-- The sum of all deltas between `temperature_data' items.
		do
			Result := delta_sum (temperature_data)
		end

	has_temperature_deltas: BOOLEAN
			-- Does Current `temperature_data' have deltas?
		do
			Result := has_deltas (temperature_data)
		end

	temperature_delta_count: INTEGER
			-- How many deltas are in `temperature_data'?
		do
			Result := delta_count (temperature_data)
		end

	latest_temperature_item: like latest_item
			-- The latest `temperature_data' item.
		do
			Result := latest_item (exhaust_data)
		end

	latest_temperature_date: detachable DATE
			-- The latest `temperature_data' item date.
		do
			if attached latest_temperature_item as al_item then
				Result := al_item.t_date
			end
		end

	latest_temperature_value: REAL
			-- The latest `temperature_data' item value.
		do
			if attached latest_temperature_item as al_item then
				Result := al_item.t_value
			end
		end

feature -- Settings

	add_exhaust_item (a_date: DATE; a_value: REAL)
			-- Add an `exhaust_data' item (datum) using `a_date' and `a_value'
		do
			add_data_item (a_date, a_value, exhaust_data)
		end

	add_temperature_item (a_date: DATE; a_value: REAL)
			-- Add an `temperature_data' item (datum) using `a_date' and `a_value'
		do
			add_data_item (a_date, a_value, temperature_data)
		end

feature {NONE} -- Implementation

	add_data_item (a_date: DATE; a_value: REAL; a_data: attached like data_type_anchor)
			-- Add data item of `a_data' and `a_value' to `a_data' list.
		do
			a_data.force ([a_date, a_value], a_date.year.out + a_date.month.out + a_date.day.out)
		ensure
			added: a_data.count = (old a_data.count + 1)
		end

	delta_sum (a_data: attached like data_type_anchor): REAL
			-- The sum of all deltas between `a_data' items.
		local
			l_last_value: REAL
		do
			if has_deltas (a_data) then
				across a_data as ic loop
					if ic.cursor_index >= second_item_const then
						Result := Result + (l_last_value - ic.item.t_value)
					end
					l_last_value := ic.item.t_value
				end
			end
		end

	has_deltas (a_data: attached like data_type_anchor): BOOLEAN
			-- Does `a_data' have `delta_count'?
		do
			Result := delta_count (a_data) > 0
		end

	delta_count (a_data: attached like data_type_anchor): INTEGER
			-- How many deltas are in `a_data'?
		do
			if a_data.count >= Second_item_const then
				Result := a_data.count - 1
			else
				Result := 0
			end
		end

	latest_item (a_data: attached like data_type_anchor): detachable TUPLE [t_date: DATE; t_value: REAL]
			-- What is the latest item in `a_data' (based on date)?
		local
			l_date: detachable DATE
		do
			across
				a_data as ic
			loop
				if (not attached l_date) xor
					(attached l_date as al_date and then ic.item.t_date > al_date)
				then
					l_date := ic.item.t_date
					Result := ic.item
				end
			end
		end

feature {NONE} -- Implementation: Type Anchors

	data_type_anchor: detachable HASH_TABLE [TUPLE [t_date: DATE; t_value: REAL], STRING]
			-- Type anchor for `exhaust_data' and `temperature_data'.
			-- The STRING key is YYYYMMDD

invariant
	has_key: not tool.is_empty and then
				not chamber.is_empty and then
				not model.is_empty and then
				not key.is_empty
	valid_deltas: (exhaust_data.count >= 2 implies has_exhaust_deltas)

note
	design: "[
		Each {EP_PUMP} object not only stores it tool, chamber, and model names
		but also its own exhaust and temperature data (loaded from elsewhere).
		
		Because it stores its own data, it can compute average deltas for the
		exhaust and temperature data stored within in.
		
		The common features for summing deltas and computing average deltas are
		found in the Implementation feature group. These are suppliers to the
		specific exhaust and temperature clients in the Exhaust and Temperature
		Queries feature groups.
		]"

end
