testing
coreTests
	^ self class environment allClasses select: [:class | 
		{'SUnit'. 'CompilerTests'. 'CollectionsTests'. 'KernelTests'} 
			anySatisfy: [:packageName | 
				class category beginsWith: packageName]]