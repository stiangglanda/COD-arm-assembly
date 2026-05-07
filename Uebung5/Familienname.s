@ File: Familienname.s 
        .text 
        .global copyStr,FName  @ HIER NICHTS EDITIEREN!!
		
@		=================================================
@
@		Name: <FAMILIENNAME> <VORNAME>       
@
@       	   >>>>FName am Dateiende editieren<<<<<
@
@		=================================================
@
@			Programm-Name: 	copyStr	
@			Programm-Art:	ASM-Unterprogramm
@           ARMSim#:        2.01 
@			Input:   
@			Output: 
@			Funktion: 
@                 
@		-------------------------------------------------

copyStr:
     	
		
@		-------------------------------------------------
@
@			Programm-Name: 	capitalize	
@			Programm-Art:	ASM-Unterprogramm	 
@			Input:   
@			Output: 
@			Funktion: 
@                 
@		-------------------------------------------------

capitalize:


@		-------------------------------------------------
@
@			Programm-Name: 	noSpecials	
@			Programm-Art:	ASM-Unterprogramm	 
@			Input:   
@			Output: 
@			Funktion: 
@                 
@		-------------------------------------------------
		
noSpecials:

		
@       =================================================

		.data
FName:	.asciz "MUELLER.txt"    @ HIER "MUELLER" ersetzen!!!
		.end
