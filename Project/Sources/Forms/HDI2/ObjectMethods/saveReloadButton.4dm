
If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Not:C34(Form:C1466.editedStudent.touched()))  // No update has been done on the entity
		ALERT:C41(Localized string("AlertMakeUpdate"))
		
	: (Form:C1466.editedStudent.rank>=100)
		ALERT:C41(Localized string("AlertRankLimit"))
		
	Else 
		
		ALERT:C41(Localized string("AlertSaveReloadFails"))
		
		PS_updater(Form:C1466.editedStudent.getKey(); "")  // Another process fully updates the current edited student and its stamp in DB
		
		DELAY PROCESS:C323(Current process:C322; 60)
		
		Form:C1466.saveStatus:=Form:C1466.editedStudent.save(dk auto merge:K85:24)  // Save with dk auto merge option
		
		If ((Form:C1466.saveStatus.success) & (Form:C1466.saveStatus.autoMerged))
			
		Else   // The save with dk auto merge option fails
			OBJECT SET VISIBLE:C603(*; "save_KO_@"; True:C214)
			OBJECT SET ENABLED:C1123(*; "saveReloadButton"; False:C215)
			OBJECT SET ENABLED:C1123(*; "cloneStudentButton"; True:C214)
		End if 
		
End case 




