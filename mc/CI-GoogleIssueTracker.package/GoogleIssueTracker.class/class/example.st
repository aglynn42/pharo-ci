to be overriden
example
	"self example"
	| tracker issue |
	"Example usage of the issue tracker"
	Halt now: 'Evaluate step by step for a better understanding'.
	tracker := GoogleIssueTracker pharo.
	
	"give back a list of all open issues"
	tracker openIssues.
	
	issue := tracker issue: 4839 "this is an explicit testing issue".
	issue comments.

	issue hasAttachment ifTrue: [
		"give back a list of the recent attachements"
		issue attachments.
		"give back a list of all attachments (including previous versions of the same file)"
		issue allAttachments].
	
	issue hasSlice ifTrue: [
		"return a Gofer object for the slice corresponding to the issue"
		issue slice].
	
	"run the tests of all packages changed by the issues's slice"
	issue isGreen.

	"authenticate with your google account to change the issues directly from your code"
	tracker authenticate: 'yourmail@gmail.com' with: 'XXX'.

	"mark the issue ready for intergation (will update the tracker)"
	issue fixToInclude.

	"mark the issue to be review with a comment"
	issue reviewNeeded: 'Could not load the attached SLICE'.