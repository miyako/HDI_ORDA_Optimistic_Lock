
If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		Form:C1466.editedStudent:=Form:C1466.selectedStudent
		
		Form:C1466.studentId:=Null:C1517
		
		OBJECT SET ENABLED:C1123(*; "processUpdateStudentButton2"; True:C214)
		OBJECT SET ENABLED:C1123(*; "dropStudentButton@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "drop_KO_@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "dropStudentMessageOKText"; False:C215)
		
End case 


