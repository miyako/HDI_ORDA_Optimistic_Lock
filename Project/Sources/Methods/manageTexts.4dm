//%attributes = {"invisible":true}
var $n; $i : Integer

If (Is Windows:C1573)
	
	ST SET ATTRIBUTES:C1093(mainDescription; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 12)
	
	$n:=Size of array:C274(_Descriptions)
	For ($i; 1; $n)
		ST SET ATTRIBUTES:C1093(_Descriptions{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 12)
	End for 
	
	$n:=Size of array:C274(_Directions)
	For ($i; 1; $n)
		ST SET ATTRIBUTES:C1093(_Directions{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 11; Attribute italic style:K65:2; 1)
	End for 
	
End if 