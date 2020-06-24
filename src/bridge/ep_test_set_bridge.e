note
	description: "A Bridge class"
	design: "[
		Bridge classes are about controlling feature group exporting
		between project targets.
		
		In this case we only want certain TEST_SET classes to have
		access to production code features (e.g. EP_DB.load_test_data).
		Otherwise, we do NOT want production code to be able to call
		such features, so we control who gets access by way of the
		export construct of the feature clause containing the features
		that we want to limit access to.
		]"
	curiosity_and_bug: "[
		For whatever reason, the {TEST_SET_BRIDGE} class is not working
		in this capacity as expected, creating the need for this class.
		I do not presently have the time to debug this, so this class
		will stand as-is for the time being.
		]"

class
	EP_TEST_SET_BRIDGE

end
