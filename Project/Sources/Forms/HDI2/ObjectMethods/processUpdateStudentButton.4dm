
If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		ALERT:C41(Localized string("AlertProcessUpdates"))
		
		PS_updater(Form:C1466.editedStudent.getKey(); "SMITH")  // Another process updates the entity (last name only) and its stamp in DB
		
		DELAY PROCESS:C323(Current process:C322; 30)
		
		//We use the getKey() and get() methods when getting the stamp of the entity in database
		//We get the entity from database and after its stamp
		Form:C1466.stampInDB:=ds:C1482.Student.get(Form:C1466.editedStudent.getKey()).getStamp()
		
		OBJECT SET ENABLED:C1123(*; "processUpdateStudentButton"; False:C215)
		OBJECT SET ENABLED:C1123(*; "updateStudentButton"; True:C214)
		
		
End case 
