private-XML code
issueXMLStatusOn: stream
	stream nextPutAll: '<issues:status>'.
	self xmlEscape: self status on: stream.
	stream nextPutAll: '</issues:status>'