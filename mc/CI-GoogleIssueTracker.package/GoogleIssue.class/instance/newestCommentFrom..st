checking
newestCommentFrom: anEmailString

	| messagesFrom |
	messagesFrom := self comments select: [:comment | comment author = anEmailString ].
	^ messagesFrom detectMax: [ :comment| comment updated ]