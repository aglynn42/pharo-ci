protocol
loadAndTestSlice
	"Load slice and run tests"
	
	self issue hasSlice ifFalse: [ ^ self ].
	self testChangeImpact: [ self loadSlice ].
	