//%attributes = {}
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

C_OBJECT:C1216($student; $0; $1; $result)

If (btnTrace)
	TRACE:C157
End if 

$student:=$1

If (Form:C1466.studentId=$student.getKey())
	$result:=New object:C1471("fontWeight"; "bold")  //Put in bold the line in the list box
End if 

$0:=$result