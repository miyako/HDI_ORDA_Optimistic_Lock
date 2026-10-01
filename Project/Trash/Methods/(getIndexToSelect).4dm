//%attributes = {"invisible":true}
C_LONGINT:C283($id; $i; $1; $0)
C_OBJECT:C1216($c)

//Returns the position of the entity in the entity selection Form.pupils

$id:=$1  // Primary key of the entity

$i:=0
For each ($c; Form:C1466.contacts) Until ($c.ID=$id)
	$i:=$i+1
End for each 

$0:=$i