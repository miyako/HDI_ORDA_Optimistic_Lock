C_BOOLEAN:C305($updateToApply)
C_OBJECT:C1216($item)


If (btnTrace)
	TRACE:C157
End if 


// RELOAD THE CURRENT EDITED STUDENT TO GET THE UP TO DATE STAMP FROM THE DB TO MAKE THE SAVE SUCCESSFULL
// ------------------------------------------------------------------------------------------------------
Form:C1466.editedStudent.reload()

//Update the current edited student with the selected values by the user
$updateToApply:=False:C215
For each ($item; Form:C1466.diffsMerge)
	If (Not:C34(Undefined:C82($item.action)))
		If ($item.action=True:C214)  // The user chose to apply his/her value
			Form:C1466.editedStudent[$item.attributeName]:=$item.value  // Apply the user's value
			$updateToApply:=True:C214
		End if 
	End if 
End for each 

If ($updateToApply)  // We applied at least one user's values - So we save the entity
	Form:C1466.saveStatus:=Form:C1466.editedStudent.save()
	If (Form:C1466.saveStatus.success)
		OBJECT SET VISIBLE:C603(*; "save_OK@"; True:C214)
	End if 
Else   // The user gave up his/her updates
	OBJECT SET VISIBLE:C603(*; "reload_OK_message"; True:C214)
End if 


OBJECT SET VISIBLE:C603(*; "save_KO@"; False:C215)
OBJECT SET ENABLED:C1123(*; "saveButton"; False:C215)

//Select the school in the list box
// The indexOf() method will be detailed in another How do I
LISTBOX SELECT ROW:C912(*; "listBoxSchoolsForMerge"; Form:C1466.editedStudent.school.indexOf(Form:C1466.schoolsList)+1)
