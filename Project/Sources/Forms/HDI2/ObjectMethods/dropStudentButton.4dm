
If (btnTrace)
	TRACE:C157
End if 

Form:C1466.dropStatus:=Form:C1466.editedStudent.drop()

If (Not:C34(Form:C1466.dropStatus.success))  // The drop action failed
	OBJECT SET VISIBLE:C603(*; "drop_KO_@"; True:C214)
	OBJECT SET ENABLED:C1123(*; "dropStudentButton"; False:C215)
	OBJECT SET ENABLED:C1123(*; "dropStudentButton2"; True:C214)
End if 

