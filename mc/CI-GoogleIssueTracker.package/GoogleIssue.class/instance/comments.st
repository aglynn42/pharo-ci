acessing
comments
	"return a list of GoogleIssueComment for this issue"
	^ comments ifNil: [ comments := {self description}, self loadComments ].