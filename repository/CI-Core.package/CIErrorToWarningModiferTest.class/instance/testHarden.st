tests
testHarden
	| rule hardenedRule result |
	
	rule := [ :change | CIValidationResult warning: 'warning' ] asCIValidationRule .
	hardenedRule := rule harden.
	
	result := hardenedRule validate.
	
	self assert: result warnings isEmpty.
	self assert: result failures first equals: 'warning'.