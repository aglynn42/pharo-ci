*CI-Core
select: aBlock inParallel: threadCount
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection."

	| addSyncronization finishSync threadBlock count addCount results|
	
	finishSync := Semaphore forMutualExclusion.
	threadBlock := Semaphore new.
	(threadCount max: 1) timesRepeat: [ threadBlock signal ].
	count := 0.
	addCount := 1.
	results := Array new: self size.
	
	^ self class streamContents: [ :stream|
		self do: [:each | |blockCount|
			threadBlock wait.
			count := count + 1.
			blockCount := count.
			[(aBlock value: each) ifTrue: [ stream nextPut: each].
				finishSync signal.
				threadBlock signal] fork].
		"consume all signals"
		count timesRepeat: [ finishSync wait ]]