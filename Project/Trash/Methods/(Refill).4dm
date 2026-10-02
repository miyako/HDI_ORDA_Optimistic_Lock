//%attributes = {"invisible":true}
READ WRITE:C146(*)


$pathContacts:=Get 4D folder:C485(Current resources folder:K5:16)
$pathContacts:=$pathContacts+"DefaultData"+Folder separator:K24:12+"Contacts.4ie"

$projectContacts:=Get 4D folder:C485(Current resources folder:K5:16)
$projectContacts:=$projectContacts+"DefaultData"+Folder separator:K24:12+"Contacts.4si"


$pathAddresses:=Get 4D folder:C485(Current resources folder:K5:16)
$pathAddresses:=$pathAddresses+"DefaultData"+Folder separator:K24:12+"Addresses.4ie"

$projectAddresses:=Get 4D folder:C485(Current resources folder:K5:16)
$projectAddresses:=$projectAddresses+"DefaultData"+Folder separator:K24:12+"Addresses.4si"



//$import:=False
//Case of 
//: (Test path name($pathContacts)#Is a document)

//: (Test path name($projectContacts)#Is a document)

//: (Test path name($pathAddresses)#Is a document)

//: (Test path name($projectAddresses)#Is a document)

//Else 
//$import:=True
//End case 



//If ($import)

IMPORT DATA:C665($pathContacts; $projectContacts; *)

IMPORT DATA:C665($pathAddresses; $projectAddresses; *)

//End if 


