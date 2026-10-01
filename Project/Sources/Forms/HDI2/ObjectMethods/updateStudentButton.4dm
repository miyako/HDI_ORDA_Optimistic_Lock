
If (btnTrace)
	TRACE:C157
End if 

If (Not:C34(Form:C1466.editedStudent.touched()))  // No update has been done on the entity
	ALERT:C41("Make an update before saving")
Else 
	
	
	Form:C1466.saveStatus:=Form:C1466.editedStudent.save()
	
	If (Not:C34(Form:C1466.saveStatus.success))
		OBJECT SET VISIBLE:C603(*; "save_KO_@"; True:C214)
		
		OBJECT SET ENABLED:C1123(*; "updateStudentButton"; False:C215)
		OBJECT SET ENABLED:C1123(*; "updateStudentButton2"; True:C214)
		
	End if 
	
End if 