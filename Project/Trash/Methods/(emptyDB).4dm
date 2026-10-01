//%attributes = {"invisible":true}
For each ($c; ds:C1482.Contact.all())
	$c.unlock()
End for each 


ds:C1482.Contact.all().drop()
ds:C1482.Address.all().drop()