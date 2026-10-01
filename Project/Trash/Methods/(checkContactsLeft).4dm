//%attributes = {"invisible":true}
C_LONGINT:C283($1; $2; $totalContacts; $contactsToDelete)

$totalContacts:=$1
$contactsToDelete:=$2

If (($totalContacts-$contactsToDelete)<=3)
	ALERT:C41("No more contacts soon ...")
End if 

