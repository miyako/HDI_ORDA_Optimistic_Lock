
C_LONGINT:C283($n; $i)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; "<"; 9)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; "="; 9)
		mainDescription:=[INFO:1]Description:2
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; ">="; 10)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]Description:2; _Directions)
		
		manageTexts
		
		buildDataFromJSON
		initPages
		RW
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		manageTexts
		
		buildDataFromJSON
		initPages
		
		
		
End case 

