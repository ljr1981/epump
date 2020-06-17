note
	description: "Notion of a New Pumps Window"

class
	EP_NEW_PUMPS_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize
		end

create
	make_with_title

feature {NONE} -- Initialization

	create_interface_objects
			--<Precursor>
		do
			Precursor
		end

	initialize
			--<Precursor>
		do
			Precursor
			set_minimum_size (800, 600)
			close_request_actions.extend (agent destroy_and_exit_if_last)
		end

end
