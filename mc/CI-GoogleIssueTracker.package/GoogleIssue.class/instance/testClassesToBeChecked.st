tests
testClassesToBeChecked

	self hasSlice ifTrue: [ ^ self impactedPackagesTests ].
	self hasAttachment ifTrue: [ ^ self dirtyPackagesTests ].

	^ self error: 'Why are you loading me ?'