private-XML code
issueXMLDescription: stream
	stream nextPutAll: '<content type="html">'.
	self xmlEscape: self description content on: stream.
	stream nextPutAll: '</content>'