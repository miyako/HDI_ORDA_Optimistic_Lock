

If (btnTrace)
	TRACE:C157
End if 

//Apply again the rank chosen previouly by the user on the edited entity
Form:C1466.editedStudent.rank:=Form:C1466.clonedStudent.rank

Form:C1466.saveStatus:=Form:C1466.editedStudent.save()

If (Form:C1466.saveStatus.success)
	
	OBJECT SET VISIBLE:C603(*; "reloadStudentMessageOKText"; False:C215)
	OBJECT SET ENABLED:C1123(*; "applyCloneButton"; False:C215)
	OBJECT SET VISIBLE:C603(*; "saveStudentMessageOKText"; True:C214)
	
	OBJECT SET RGB COLORS:C628(*; "editedStudentRank"; Form:C1466.colorApplied; Background color:K23:2)
	
End if 






