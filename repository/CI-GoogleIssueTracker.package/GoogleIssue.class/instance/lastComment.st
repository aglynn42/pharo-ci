accessing
lastComment
	^ self comments detectMax: [ :comment| comment published ]