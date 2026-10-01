//%attributes = {"invisible":true}
FakeData_ArraysInit

C_LONGINT:C283($nbToCreate)
C_OBJECT:C1216($templatePupil)

// We create 3 schools

ds:C1482.School.all().drop()

$school:=ds:C1482.School.new()
$school.name:="Arts schools"
$school.save()

$school:=ds:C1482.School.new()
$school.name:="Mathematics school"
$school.save()

$school:=ds:C1482.School.new()
$school.name:="Literature school"
$school.save()

// We create 3 schools

ds:C1482.School.all().drop()

$school:=ds:C1482.School.new()
$school.name:="Arts schools"
$school.save()

$school:=ds:C1482.School.new()
$school.name:="Mathematics school"
$school.save()

$school:=ds:C1482.School.new()
$school.name:="Literature school"
$school.save()

ds:C1482.School.all().drop()

$templateSchool:=New object:C1471
$templateSchool.state:="state"

$school:=ds:C1482.School.new()
FakeData_FillObjectTemplate($templateSchool; $school)
$school.name:="Arts schools"
$school.save()

$school:=ds:C1482.School.new()
FakeData_FillObjectTemplate($templateSchool; $school)
$school.name:="Mathematics school"
$school.save()

$school:=ds:C1482.School.new()
FakeData_FillObjectTemplate($templateSchool; $school)
$school.name:="Literature school"
$school.save()

$nbToCreate:=9  // We create 9 pupils

$templatePupil:=New object:C1471
$templatePupil.firstName:="firstname"
$templatePupil.lastName:="lastname"
$templatePupil.email:="email"

ds:C1482.Pupil.all().drop()

$school:=ds:C1482.School.all().first()

For ($i; 1; $nbToCreate)
	
	$pupil:=ds:C1482.Pupil.new()
	
	FakeData_FillObjectTemplate($templatePupil; $pupil)
	
	Case of 
		: ($i=4)
			$school:=$school.next()
		: ($i=7)
			$school:=$school.next()
			
	End case 
	
	If ($i<=3)
		$pupil.school:=$school
		$d:=
		
		
	End if 
	If (($i>=4) & ($i<=6))
		$pupil.school:=$school
		
	End if 
	If (($i>=7) & ($i<=9))
		$pupil.school:=$school
		
	End if 
	
	
	$saveStatus:=$pupil.save()
	
End for 

FakeData_ArraysDeinit