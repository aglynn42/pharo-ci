comparing
= anObject
	(anObject isKindOf: self class) 
		ifFalse: [ ^ false ].
		
	^ self issue = anObject issue and: [ self name = anObject name ]