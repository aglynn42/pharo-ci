tests
testModify
	| aResult aModifyResult |
	
	
	aResult := CIValidationResult new.
	aResult addError: 'a'.
	aResult addMessage: 'b'.
	aResult addWarning: 'c'.
	aModifyResult := CIErrorToWarningModifer new modifyResult: aResult.
	
	self assert: aResult errors size equals: 1.	
	self assert: aResult messages size equals: 1.	
	self assert: aResult warnings size equals: 1.	
	
	self assert: aModifyResult warnings size equals: 2.	
	self assert: aModifyResult messages size equals: 1.	
	self assert: aModifyResult errors size equals: 0.	
		
	self assert: (aModifyResult warnings first = 'a').
	self assert: (aModifyResult warnings second = 'c').
	self assert: (aModifyResult messages first = 'b').