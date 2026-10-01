//%attributes = {"invisible":true}
//****************************************//
// Meta attribute examples
//
// fill: CSS color
// stroke: CSS color
// fontStyle:  "italic" 
// fontWeight: "bold" 
// textDecoration:  "underline"
// unselectable:  True or False 
// disabled:  True or False 
//****************************************//

#DECLARE($student : Object)->$result : Object

If (btnTrace)
	TRACE:C157
End if 

If (Form:C1466.studentId=$student.getKey())
	$result:=New object:C1471("fontWeight"; "bold")  //Put in bold the line in the list box
End if 
