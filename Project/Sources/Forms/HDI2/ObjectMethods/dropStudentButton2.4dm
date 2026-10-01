C_BOOLEAN:C305(btnTrace)

If (btnTrace)
	TRACE:C157
End if 

Form:C1466.dropStatus:=Form:C1466.editedStudent.drop(dk force drop if stamp changed:K85:17)  // Drop with option dk force drop if stamp changed

If (Form:C1466.dropStatus.success)
	
	ALERT:C41("You have dropped the "+Form:C1466.editedStudent.firstName+" "+Form:C1466.editedStudent.lastName+" student")
	
	OBJECT SET ENABLED:C1123(*; "dropStudentButton2"; False:C215)
	OBJECT SET VISIBLE:C603(*; "drop_KO_@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "dropStudentMessageOKText"; True:C214)
	
	//Refresh the list box
	Form:C1466.students:=ds:C1482.Student.all()
	LISTBOX SET PROPERTY:C1440(*; "listBoxDropOption"; lk selection mode:K53:35; lk single:K53:58)
End if 
