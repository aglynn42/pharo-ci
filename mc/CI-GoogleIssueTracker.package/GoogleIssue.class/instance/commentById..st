acessing
commentById: anInteger
	^ self comments detect: [ :comment| comment id = anInteger ]