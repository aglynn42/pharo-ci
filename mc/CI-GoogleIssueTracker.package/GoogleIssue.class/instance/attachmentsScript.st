loading
attachmentsScript
	"since there is no api for accessing attachments from the google issuetracker we have to manually fetch the website and extract the attachments :)"
	
	^ (self attachments collect: [:e | '']) joinUsing: '.
	'	