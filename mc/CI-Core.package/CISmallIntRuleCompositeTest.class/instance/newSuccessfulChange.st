accessing
newSuccessfulChange
	^ CITestChange loadBlock: [ 
		(Object subclass: #CITestClass	
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: 'CI-Test').
		#CITestClass asClass comment: 'foo'. ]