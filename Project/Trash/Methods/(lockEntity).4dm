//%attributes = {"invisible":true}

entityToLockID:=$1

$entities:=ds:C1482.Contact.query("ID = :1"; entityToLockID)

If ($entities.length=0)
Else 
	lockStatus:=$entities[0].lock(0)
	
	$win:=Open form window:C675("LockForm"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("LockForm")
	//CLOSE WINDOW
	
End if 
