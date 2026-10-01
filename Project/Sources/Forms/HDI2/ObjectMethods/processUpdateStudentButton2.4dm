

If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		ALERT:C41("Before the drop action, another process has updated the student so the stamp has changed. "+Char:C90(13)+Char:C90(13)+"That process changed the last name to MAC ARTHUR")
		
		PS_updater(Form:C1466.editedStudent.getKey(); "MAC ARTHUR")  //Another process updates the entity (last name only) and its stamp in DB
		
		DELAY PROCESS:C323(Current process:C322; 30)
		
		Form:C1466.studentId:=Form:C1466.editedStudent.getKey()
		
		//We use the getKey() and get() methods when getting the stamp of the entity in database
		//We get the entity from database and after its stamp
		Form:C1466.stampInDB:=ds:C1482.Student.get(Form:C1466.editedStudent.getKey()).getStamp()
		
		//Refresh the list box
		Form:C1466.students:=ds:C1482.Student.all()
		LISTBOX SELECT ROW:C912(*; "listBoxDropOption"; Form:C1466.editedStudent.indexOf(Form:C1466.students)+1)
		OBJECT SET SCROLL POSITION:C906(*; "listBoxDropOption"; Form:C1466.editedStudent.indexOf(Form:C1466.students)+1)
		
		OBJECT SET ENABLED:C1123(*; "processUpdateStudentButton2"; False:C215)
		OBJECT SET ENABLED:C1123(*; "dropStudentButton"; True:C214)
		
		LISTBOX SET PROPERTY:C1440(*; "listBoxDropOption"; lk selection mode:K53:35; lk none:K53:57)
End case 


