
If (btnTrace)
	TRACE:C157
End if 

Form:C1466.diffs:=New collection:C1472

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		OBJECT SET VISIBLE:C603(*; "diff_@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "diffschool@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "compare_button"; False:C215)
		
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedStudents.length=2)
			OBJECT SET ENABLED:C1123(*; "compare_button"; True:C214)
		End if 
		
		
End case 