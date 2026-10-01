C_OBJECT:C1216($status)


If (btnTrace)
	TRACE:C157
End if 

$status:=Form:C1466.editedStudent.reload()  //Reload the entity from database.

If ($status.success)
	
	OBJECT SET VISIBLE:C603(*; "reloadStudentMessageOKText"; True:C214)
	OBJECT SET ENABLED:C1123(*; "reloadStudentButton"; False:C215)
	OBJECT SET ENABLED:C1123(*; "applyCloneButton"; True:C214)
	
	OBJECT SET RGB COLORS:C628(*; "edited@"; 0x00C2009E; Background color:K23:2)
	
End if 

