note
	description: "Abstraction of a Common Presetation Widget"

deferred class
	EP_WIDGET [G -> EV_WIDGET]

feature -- Access

	widget: G
			-- The widget referenced by Current.

;note
	design: "[
		This class follows the Has-a model, rather than the Is-a (inheritance)
		model. That means this class has a feature to reference the widget
		rather than inheriting and "becoming" the widget.
		]"

end
