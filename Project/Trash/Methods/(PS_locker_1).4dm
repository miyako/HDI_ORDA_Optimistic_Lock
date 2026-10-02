//%attributes = {"invisible":true}
C_LONGINT:C283($1)  // id to lock
C_LONGINT:C283($2)  // if NOT passed create process

C_LONGINT:C283($ps)
C_LONGINT:C283($win)

If (Count parameters:C259=1)
	
	$ps:=New process:C317(Current method name:C684; 0; Current method name:C684; $1; 0; *)
	
Else 
	
	idToLock:=$1
	
	$win:=Open form window:C675("LockForm"; Plain form window:K39:10; On the right:K39:3; Vertically centered:K39:4)
	DIALOG:C40("LockForm")
	
	
End if 