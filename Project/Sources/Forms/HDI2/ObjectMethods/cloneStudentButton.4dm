C_OBJECT:C1216($status)


If (btnTrace)
	TRACE:C157
End if 

Form:C1466.clonedStudent:=Form:C1466.editedStudent.clone()  //Clone the entity - It creates a new reference

OBJECT SET VISIBLE:C603(*; "save_KO_@"; False:C215)
OBJECT SET ENABLED:C1123(*; "cloneStudentButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "reloadStudentButton"; True:C214)

