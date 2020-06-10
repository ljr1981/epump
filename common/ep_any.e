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

end
