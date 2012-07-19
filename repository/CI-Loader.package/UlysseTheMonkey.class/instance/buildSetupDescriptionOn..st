printing
buildSetupDescriptionOn: aStream
	
	aStream nextPutAll: '----------------------------------------------------------'; lf.
	aStream nextPutAll: 'Loaded Source: '.
	
	self issue hasSlice ifTrue: [ 
		aStream 
			nextPutAll: self slice name;
			nextPutAll: ' from ';
			nextPutAll: self slice repository description ].
		
	self issue hasChangeSet
		ifTrue: [
			self issue changeSets size > 1 ifTrue: [ aStream lf tab ].
			self issue changeSets 
					do: [ :attachment|  aStream nextPutAll: attachment description ]
					separatedBy: [ aStream lf tab ]].
		
	aStream lf;
		nextPutAll: 'Tested using '; nextPutAll: SystemVersion current imageVersionString;
		nextPutAll: ' on '; nextPutAll: Smalltalk vm version