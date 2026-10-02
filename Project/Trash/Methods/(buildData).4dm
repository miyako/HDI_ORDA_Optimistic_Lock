//%attributes = {"invisible":true}
// Fill the database with data
// ---------------------------   
// This has already run - DO NOT RUN AGAIN
// --------------------------------------- 

FakeData_ArraysInit

C_LONGINT:C283($nbToCreate)
C_OBJECT:C1216($templateContact; $templateAddress)

$nbToCreate:=10  // We create 3 contacts

ds:C1482.Contact.all().drop()
ds:C1482.Address.all().drop()

$templateContact:=New object:C1471
$templateContact.firstName:="firstname"
$templateContact.lastName:="lastname"

$templateAddress:=New object:C1471
$templateAddress.street:="address"
$templateAddress.zipCode:="zipCode"
$templateAddress.state:="state"
$templateAddress.country:="country"


For ($i; 1; $nbToCreate)
	
	$contact:=ds:C1482.Contact.new()
	$address:=ds:C1482.Address.new()
	$contact.address:=$address
	
	FakeData_FillObjectTemplate($templateContact; $contact)
	FakeData_FillObjectTemplate($templateAddress; $address)
	
	$saveContactStatus:=$contact.save()
	$saveAddressStatus:=$address.save()
	
End for 


FakeData_ArraysDeinit