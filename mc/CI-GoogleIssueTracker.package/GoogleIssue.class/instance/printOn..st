printing
printOn: aStream
	super printOn: aStream.
	aStream 
		nextPutAll:  '(#' ;
		nextPutAll:  self id asString; 
		nextPutAll:  ': ';
		nextPutAll:  self title asString;
		nextPutAll:  ')'