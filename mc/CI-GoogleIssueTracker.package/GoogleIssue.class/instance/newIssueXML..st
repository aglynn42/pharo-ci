new issue
newIssueXML: stream

	self 
		issueXMLHeaderOn: stream;
		issueXMLTitleOn: stream;
		issueXMLDescription: stream;
		issueXMLAuthorOn: stream;
		issueXMLStatusOn: stream;
		issueXMLOwnerOn: stream;
		issueXMLLabelsOn: stream;
		issueXMLFooterOn: stream