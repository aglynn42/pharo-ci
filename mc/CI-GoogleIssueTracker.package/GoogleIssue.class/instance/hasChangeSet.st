testing
hasChangeSet
	^ self attachments anySatisfy: [ :each| 
		(each filename endsWith: '.cs') or: [ each filename endsWith: '.st' ]].