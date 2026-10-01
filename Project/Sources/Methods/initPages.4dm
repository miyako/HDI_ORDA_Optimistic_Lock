//%attributes = {"invisible":true}
var $index : Integer
var $p1; $p2 : Object
var $schools : Collection

//Business logic related to ORDA

Form:C1466.editedStudent:=ds:C1482.Student.all().first()
Form:C1466.schoolsList:=ds:C1482.School.all()
Form:C1466.students:=ds:C1482.Student.all().orderBy("school.name")

// Save with merge option
// -------------------------------------------------------
OBJECT SET ENABLED:C1123(*; "processUpdateStudentButton"; True:C214)
OBJECT SET ENABLED:C1123(*; "updateStudentButton@"; False:C215)
OBJECT SET VISIBLE:C603(*; "save_KO_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "save_OK_@"; False:C215)
OBJECT SET RGB COLORS:C628(*; "studentToMergeLastName"; Foreground color; Background color:K23:2)

//Select the school in the list box
// The indexOf() method will be detailed in another How do I
LISTBOX SELECT ROW:C912(*; "listBoxSchoolsForUpdate"; Form:C1466.editedStudent.school.indexOf(Form:C1466.schoolsList)+1)



//Clone and reload
// -----------------
OBJECT SET ENABLED:C1123(*; "saveReloadButton"; True:C214)
OBJECT SET ENABLED:C1123(*; "cloneStudentButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "reloadStudentButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "applyCloneButton"; False:C215)
OBJECT SET VISIBLE:C603(*; "save_KO_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "reloadStudentMessageOKText"; False:C215)
OBJECT SET VISIBLE:C603(*; "saveStudentMessageOKText"; False:C215)
OBJECT SET RGB COLORS:C628(*; "edited@"; Foreground color; Background color:K23:2)
Form:C1466.clonedStudent:=New object:C1471


// Drop with force drop option
// -------------------------------------------------------
OBJECT SET ENABLED:C1123(*; "processUpdateStudentButton2"; False:C215)
OBJECT SET ENABLED:C1123(*; "dropStudentButton@"; False:C215)
OBJECT SET VISIBLE:C603(*; "drop_KO_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "dropStudentMessageOKText"; False:C215)
LISTBOX SET PROPERTY:C1440(*; "listBoxDropOption"; lk selection mode:K53:35; lk single:K53:58)
Form:C1466.studentId:=Null:C1517

//Touched attributes
// ---------------------------------------------------------
OBJECT SET ENABLED:C1123(*; "updatedFieldsButton"; True:C214)
OBJECT SET VISIBLE:C603(*; "diff_@"; False:C215)
//Select the school in the list box
// The indexOf() method will be detailed in another How do I
LISTBOX SELECT ROW:C912(*; "listBoxSchoolsForTouched"; Form:C1466.editedStudent.school.indexOf(Form:C1466.schoolsList)+1)


//Diff
// ----------------------------------------------------------
OBJECT SET ENABLED:C1123(*; "compare_button"; True:C214)
OBJECT SET VISIBLE:C603(*; "diff_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "diffschool@"; False:C215)

//Select 2 students with different schools - There are 3 possible schools
$schools:=ds:C1482.School.all().distinct("name")  // Get a collection with the schools names
$p1:=ds:C1482.Student.query("school.name=:1"; $schools[0])  // Get an entity selection of students having the first school
$p2:=ds:C1482.Student.query("school.name=:1"; $schools[1])  // Get an entity selection of students having the second school

If (($p1.length#0) & ($p2.length#0))
	$index:=$p1.first().indexOf(Form:C1466.students)
	// The indexOf() method will be detailed in another How do I
	LISTBOX SELECT ROW:C912(*; "listBoxDiff"; $index+1)  // Select the first student with the school name = $schools[0]
	$index:=$p2.first().indexOf(Form:C1466.students)
	LISTBOX SELECT ROW:C912(*; "listBoxDiff"; $index+1; lk add to selection:K53:2)  // Select the first student with the school name = $schools[1]
End if 


//Resolve conflicts
// ---------------------------------------------------------
OBJECT SET ENABLED:C1123(*; "saveAutoMergeButton"; True:C214)
OBJECT SET ENABLED:C1123(*; "saveButton"; False:C215)
OBJECT SET VISIBLE:C603(*; "save_KO@"; False:C215)
OBJECT SET VISIBLE:C603(*; "save_OK@"; False:C215)
OBJECT SET VISIBLE:C603(*; "reload_OK@"; False:C215)
OBJECT SET VISIBLE:C603(*; "diff_@"; False:C215)

//Select the school in the list box
// The indexOf() method will be detailed in another How do I
LISTBOX SELECT ROW:C912(*; "listBoxSchoolsForMerge"; Form:C1466.editedStudent.school.indexOf(Form:C1466.schoolsList)+1)


btnTrace:=False:C215
