private-XML code
issueXMLUpdatesOn: stream
	
	stream	nextPutAll: '<issues:updates>'.
	self issueXMLStatusOn: stream.
	self issueXMLLabelsOn: stream.
	stream nextPutAll: '</issues:updates>'