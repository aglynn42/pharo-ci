comparing
= anObject
	(anObject isKindOf: self class)
		ifFalse: [ ^ false ].
	
	"for now the url is enough, should be extended to check things like lables and so forth"
	^ self url = anObject url
	