note
	description: "Common code to all System Classes"
	design: "[
		EP_DOCS is here so you can look at any system documentation.
		
		EP_CONSTANTS is for any constants with system-wide scope.
			(this is a softer way to implement the notion of "Global"
			 without creating a buggy train wreck)
		]"

class
	EP_ANY

inherit
	EP_DOCS

	EP_CONSTANTS

feature -- Access

	logger: LOG_LOGGING_FACILITY
			-- Logger for system
		once
			create Result.make
			Result.enable_default_file_log
			-- UNKNO < EMERG < ALERT < CRIT < ERROR < WARN < NOTIC < INFO < DEBUG
			inspect
				log_level
			when 1 then -- EMERG
				Result.default_log_writer_file.enable_emergency_log_level
			when 2 then -- ALERT
				Result.default_log_writer_file.enable_alert_log_level
			when 3 then -- CRIT
				Result.default_log_writer_file.enable_critical_log_level
			when 4 then -- ERROR
				Result.default_log_writer_file.enable_error_log_level
			when 5 then -- WARN
				Result.default_log_writer_file.enable_warning_log_level
			when 6 then -- NOTIC
				Result.default_log_writer_file.enable_notice_log_level
			when 7 then -- INFO
				Result.default_log_writer_file.enable_information_log_level
			when 8 then -- DEBUG
				Result.default_log_writer_file.enable_debug_log_level
			else -- revert to error level
				Result.default_log_writer_file.enable_error_log_level
			end

		end

	log_level: INTEGER
			-- Log level as set from Preferences.

	set_log_level (i: like log_level)
			-- Set `log_level' to `i'
		do
			log_level := i
		ensure
			set: log_level = i
		end

	log_debug (a_parent: ANY; a_message: STRING)
			--
		do
			logger.write_debug ("{" + a_parent.generating_type + "}%T" + a_message)
		end

	log_info (a_parent: ANY; a_message: STRING)
			--
		do
			logger.write_information ("{" + a_parent.generating_type + "}%T" + a_message)
		end

end
