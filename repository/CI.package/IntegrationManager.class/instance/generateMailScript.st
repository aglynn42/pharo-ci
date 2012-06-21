private
generateMailScript

	FileDirectory default forceNewFileNamed: 'mail.scpt' do: [:s | 
		s nextPutAll: 'set my_content to "'; nextPutAll: self summary; nextPutAll:'"'; cr.
		s nextPutAll: 'set accountName to "Ulysse<pharo.ulysse@gmail.com>"'; cr.
		s nextPutAll: 'set my_subject to "'; nextPutAll: self versionPrefix; print: self newVersionNumber; nextPutAll: '"' ; cr;cr.
		s nextPutAll: 'tell application "Mail"
	set theNewMessage to make new outgoing message with properties {sender:accountName, subject:my_subject, content:my_content, visible:true}
	tell theNewMessage
		make new to recipient at end of to recipients with properties {address:"Pharo-project@lists.gforge.inria.fr"}
		send
	end tell
end tell

tell application "Mail"
	set theNewMessage to make new outgoing message with properties {sender:accountName, subject:my_subject, content:my_content, visible:true}
	tell theNewMessage
		make new to recipient at end of to recipients with properties {name:"A friendly place where any question about pharo is welcome", address:"pharo-users@lists.gforge.inria.fr"}
		send
	end tell
end tell' ].