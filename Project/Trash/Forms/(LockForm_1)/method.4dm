
C_OBJECT:C1216($status)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.contact:=ds:C1482.Contact.get(idToLock)
		
		$status:=Form:C1466.contact.lock()
		
	: (Form event code:C388=On Unload:K2:2)
		
		$status:=Form:C1466.contact.unlock()
		
End case 