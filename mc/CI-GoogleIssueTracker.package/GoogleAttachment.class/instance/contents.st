accessing
contents
	^ contents ifNil: [ contents := (ZnEasy get: self url) contents ]