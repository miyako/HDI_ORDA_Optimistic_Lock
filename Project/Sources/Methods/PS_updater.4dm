//%attributes = {}
C_LONGINT:C283($1)  // primary key of the entity to update
C_TEXT:C284($2)  // Optional parameter (last name of the entity to update)
C_LONGINT:C283($3)  // if NOT passed create the process
C_LONGINT:C283($ps)
C_OBJECT:C1216($status; $studentToUpdate; $schoolslist)
C_LONGINT:C283($indexSchool; $key)
C_TEXT:C284($lastName)


If (Count parameters:C259=2)
	
	$ps:=New process:C317(Current method name:C684; 0; Current method name:C684; $1; $2; 0; *)
	
Else 
	
	$key:=$1
	$lastName:=$2
	
	$studentToUpdate:=ds:C1482.Student.get($key)  // Get the entity to update
	
	Case of 
		: ($lastName#"")  //Update only the last name of the entity with the given parameter $2
			$studentToUpdate.lastName:=$lastName
			
		Else   //Update all the properties of the entity
			
			//Update first name, last name, email, rank
			$studentToUpdate.email:=$studentToUpdate.firstName+"."+$studentToUpdate.lastName+"@4D.com"
			$studentToUpdate.firstName:=Uppercase:C13($studentToUpdate.firstName)
			$studentToUpdate.lastName:=Uppercase:C13($studentToUpdate.lastName)
			$studentToUpdate.rank:=$studentToUpdate.rank+100
			
			//Change the school
			//There are 3 existing schools
			$schoolslist:=ds:C1482.School.all().orderBy("ID")
			
			$indexSchool:=$studentToUpdate.school.indexOf($schoolslist)
			$indexSchool:=$indexSchool+1
			
			If ($indexSchool>=3)
				$indexSchool:=0
			End if 
			
			$studentToUpdate.school:=$schoolslist[$indexSchool]
			
	End case 
	
	//Save the entity so the stamp will change
	$status:=$studentToUpdate.save()
	
End if 