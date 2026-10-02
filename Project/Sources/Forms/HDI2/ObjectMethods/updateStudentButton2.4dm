var $status : Object

If (btnTrace)
	TRACE:C157
End if 

$status:=Form:C1466.editedStudent.save(dk auto merge:K85:24)  // Save with dk auto merge option

//We use the getKey() and get() methods when getting the stamp of the entity in database.
//We get the entity from database and after its stamp
Form:C1466.stampInDB:=ds:C1482.Student.get(Form:C1466.editedStudent.getKey()).getStamp()

If ($status.success & $status.autoMerged)  // The save with auto merge is successful
	
	OBJECT SET VISIBLE:C603(*; "save_KO@"; False:C215)
	OBJECT SET ENABLED:C1123(*; "updateStudentButton2"; False:C215)
	
	OBJECT SET VISIBLE:C603(*; "save_OK_@"; True:C214)
	
	OBJECT SET RGB COLORS:C628(*; "studentToMergeLastName"; Form:C1466.colorMerged; Background color:K23:2)
	
	
End if 