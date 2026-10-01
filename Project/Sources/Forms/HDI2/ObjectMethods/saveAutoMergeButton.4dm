C_OBJECT:C1216($item; $schoolAttribute)
C_COLLECTION:C1488($schoolSearch; $touchedAttributes)
C_LONGINT:C283($schoolIndex; $index)


If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Not:C34(Form:C1466.editedStudent.touched()))  // No update has been done on the entity
		ALERT:C41("Make an update before saving")
		
	: (Form:C1466.editedStudent.rank>=100)
		ALERT:C41("Rank must be less than 100")
		
	Else 
		ALERT:C41("Before the save action, another process has updated the student "+Char:C90(13)+Char:C90(13)+"so the save() method (even with dk auto merge selector) fails ...")
		
		PS_updater(Form:C1466.editedStudent.getKey(); "")  // Another process fully updates the current edited student and its stamp in DB
		
		DELAY PROCESS:C323(Current process:C322; 60)
		
		Form:C1466.saveStatus:=Form:C1466.editedStudent.save(dk auto merge:K85:24)  // Save with dk auto merge option
		
		If ((Form:C1466.saveStatus.success) & (Form:C1466.saveStatus.autoMerged))
			
		Else 
			
			If (Not:C34(Form:C1466.saveStatus.autoMerged))  // The save with auto merge option failed - The auto merge was impossible
				
				Form:C1466.studentFromDB:=ds:C1482.Student.get(Form:C1466.editedStudent.getKey())  // Get the entity from DB
				
				// Compare the current edited student in memory with the up to date student in DB
				Form:C1466.diffsMerge:=Form:C1466.editedStudent.diff(Form:C1466.studentFromDB)
				
				//Remove the item with the related entity school from the collection Form.diffsMerge
				$schoolSearch:=Form:C1466.diffsMerge.query("attributeName=:1"; "school")
				If ($schoolSearch.length#0)
					$schoolAttribute:=$schoolSearch[0]
					$schoolIndex:=Form:C1466.diffsMerge.indexOf($schoolAttribute)
					Form:C1466.diffsMerge.remove($schoolIndex; 1)
				End if 
				
				// Show the user's updated value only for touched attributes on the edited student in memory
				// Add a check box for touched attributes only
				$touchedAttributes:=Form:C1466.editedStudent.touchedAttributes()  // Get touched attributes on the edited student in memory
				For each ($item; Form:C1466.diffsMerge)
					$index:=$touchedAttributes.indexOf($item.attributeName)
					If ($index=-1)  //The memory content is different from DB but has not been touched in memory
						$item.value:=""
					Else 
						$item.action:=True:C214  // Add the check box to allow the user to choose between his/her updates and the DB's content
					End if 
					
				End for each 
				
				OBJECT SET VISIBLE:C603(*; "save_KO_@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "diff_@"; True:C214)
				OBJECT SET ENABLED:C1123(*; "saveAutoMergeButton"; False:C215)
				OBJECT SET ENABLED:C1123(*; "saveButton"; True:C214)
				
			End if 
		End if 
End case 


