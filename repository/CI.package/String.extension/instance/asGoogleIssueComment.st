*CI
asGoogleIssueComment
	^ GoogleIssueComment new
		content: self;
		author: (GoogleUser email: Author fullName);	
		yourself