accessing
tracker

	^ tracker ifNil: [ 
		self initializeTracker.
		tracker ].