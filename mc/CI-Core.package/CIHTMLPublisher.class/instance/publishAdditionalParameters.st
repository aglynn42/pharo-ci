helper parameters
publishAdditionalParameters
	self additionalParameters keysAndValuesDo: [ :name :description |
		self stream 
			<< '<tr><td>'; 
			<< name asString; 
			<< '</td><td>';
			<< description asString; 
			<< '</td></tr>'; lf ]