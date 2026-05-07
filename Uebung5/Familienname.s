@ File: Familienname.s 
        .text 
        .global copyStr,FName  @ HIER NICHTS EDITIEREN!!
		
@		=================================================
@
@		Name: Kieweg Leander       
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
@               int copyStr(char *source, char *target) {
@                       while(*source != '\0') {
@                               if (*target == '\0') {
@                                       return -1;
@                               }
@                               *target = *source;
@                               target++;
@                               source++;
@                       }
@                       *target = '\0';
@
@                       return 0;
@               }
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
FName:	.asciz "KIEWEG.txt"
		.end
