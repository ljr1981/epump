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
		attribute
			create Result.make
			Result.enable_default_file_log
			Result.default_log_writer_file.enable_debug_log_level
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
