note
	description: "Primary GUI Application Class"

class
	EP_APP

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize Current.
		do
			create application
			create main_window.make_with_title ("ePump")

			application.post_launch_actions.extend (agent main_window.show)

			main_window.set_size (800, 600)
			main_window.close_request_actions.extend (agent main_window.destroy_and_exit_if_last)
			main_window.close_request_actions.extend (agent application.destroy)

			application.launch
		end

feature {NONE} -- Implementation

	application: EV_APPLICATION
			-- Primary core application.

	main_window: EP_MAIN_WINDOW
			-- Primary application window.

end
