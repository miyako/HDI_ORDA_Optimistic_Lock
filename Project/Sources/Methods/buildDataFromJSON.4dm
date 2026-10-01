//%attributes = {"invisible":true}
var $txtStudents; $txtSchools : Text
var $studentsColl; $schoolsColl : Collection


$txtStudents:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"students_data.json")
$txtSchools:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"schools_data.json")

$studentsColl:=JSON Parse:C1218($txtStudents)
$schoolsColl:=JSON Parse:C1218($txtSchools)

ds:C1482.School.all().drop()
ds:C1482.Student.all().drop()

ds:C1482.School.fromCollection($schoolsColl)
ds:C1482.Student.fromCollection($studentsColl)