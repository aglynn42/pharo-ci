integration-private
statusUpdateXML: aMessage on: stream

	self issueXMLHeaderOn: stream.
	self issueXMLDescription: aMessage on: stream.
	self issueXMLAuthorOn: stream.
	self issueXMLUpdatesOn: stream.
	self issueXMLFooterOn: stream