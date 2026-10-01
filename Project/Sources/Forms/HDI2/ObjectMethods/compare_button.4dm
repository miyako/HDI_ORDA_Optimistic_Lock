var $schoolSearch : Collection
var $schoolAttribute : Object
var $schoolIndex : Integer


If (btnTrace)
	TRACE:C157
End if 

//Form.selectedStudents contains the 2 selected entities in the list box
Form:C1466.entity1:=Form:C1466.selectedStudents.first()
Form:C1466.entity2:=Form:C1466.entity1.next()

Form:C1466.diffs:=Form:C1466.entity1.diff(Form:C1466.entity2)  // Compare the 2 entities selected in the list box

//Search the related entity attribute "school" in the collection Form.diffs
$schoolSearch:=Form:C1466.diffs.query("attributeName=:1"; "school")

If ($schoolSearch.length#0)
	
	//Build 2 entity selections Form.schools1 and Form.schools2
	//Each one contains a school
	//The collection $schoolSearch contains only 1 object
	Form:C1466.school1:=$schoolSearch[0].value  //Related entity school
	Form:C1466.school2:=$schoolSearch[0].otherValue  //Related entity school
	
	Form:C1466.schools1:=ds:C1482.School.newSelection()
	Form:C1466.schools1.add(Form:C1466.school1)
	Form:C1466.schools2:=ds:C1482.School.newSelection()
	Form:C1466.schools2.add(Form:C1466.school2)
	
	//Remove the item with the related entity attribute "school" from the collection Form.diffs
	$schoolAttribute:=$schoolSearch[0]
	$schoolIndex:=Form:C1466.diffs.indexOf($schoolAttribute)
	Form:C1466.diffs.remove($schoolIndex; 1)
	
	OBJECT SET VISIBLE:C603(*; "diffschool@"; True:C214)
	
End if 

OBJECT SET VISIBLE:C603(*; "diff_@"; True:C214)

manageTexts