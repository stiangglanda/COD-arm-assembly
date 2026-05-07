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
@                               *source = capitalize(*source);
@                               *source = noSpecials(*source);
@                               if (*source != NULL) {
@                                       *target++ = *source;
@                               }
@                               source++;
@                       }
@                       *target = '\0';
@
@                       return 0;
@               }
@                 
@		-------------------------------------------------


copyStr:                              @ r0 = char *source, r1 = char *target
        push    {r2, r3, lr}          @ Register retten
while:
        ldrb    r2, [r0]              @ r2 = *source
        cmp     r2, #0                @ while(*source != '\0')
        beq     Done

        ldrb    r3, [r1]              @ r3 = *target
        cmp     r3, #0                @ if (*target == '\0')
        moveq   r0, #-1               @ return -1
        beq     Return

        push    {r0}                  @ Save r0
        mov     r0, r2                @ r0 = *source
        bl      capitalize            @ *source = capitalize(*source);
        bl      noSpecials            @ *source = noSpecials(*source);
        mov     r2, r0                @ r2 = *source
        pop     {r0}                  @ Restore r0

        cmp     r2, #0                @ if (*source != NULL) {
        beq     SkipStore
        strb    r2, [r1], #1          @ *target++ = *source; }
SkipStore:
        add     r0, r0, #1            @ source++
        b       while
Done:  
        mov     r0, #0                @ return 0;
        strb    r0, [r1]              @ *target = '\0';
Return:
        pop     {r2, r3, lr}          @ Register restaurieren
        mov     pc, lr                @ return
		
@		-------------------------------------------------
@
@			Programm-Name: 	capitalize	
@			Programm-Art:	ASM-Unterprogramm	 
@			Input:   
@			Output: 
@			Funktion: 
@                 
@               char Capitalize(char c) {
@                       if(c >= 'a' && c <= 'z') {
@                               c = c - 32;  // 'a' - 'A' = 32
@                       }
@                       return c;
@               }       
@
@		-------------------------------------------------

capitalize:                           @ r0 = c
        cmp     r0, #'a'              @ if(c >= 'a'
        blt     CapDone               
        cmp     r0, #'z'              @ && c <= 'z')
        suble   r0, r0, #32           @ c = c - 32;
CapDone:
        mov     pc, lr                @ return c;



@		-------------------------------------------------
@
@			Programm-Name: 	noSpecials	
@			Programm-Art:	ASM-Unterprogramm	 
@			Input:   
@			Output: 
@			Funktion: 
@               
@               char NoSpecials(char c) {
@                       char originalC = c
@                       c = Capitalize(c)
@                       if(c >= 'A' && c <= 'Z') {
@                               return originalC;
@                       }
@                       return NULL;
@               }
@
@		-------------------------------------------------
		
noSpecials:                           @ r0 = c
        push    {r0, lr}              @ char originalC = c and save lr
        bl      capitalize            @ c = Capitalize(c);
        cmp     r0, #'A'              @ if(c >= 'A'
        blt     SpecDone               
        cmp     r0, #'Z'              @ && c <= 'Z')
        bgt     SpecDone
        pop     {r0, pc}              @ return originalC
SpecDone:
        pop     {r0, lr}              @ restore originalC and lr
        mov     r0, #0                @ return NULL;
        mov     pc, lr                @ return
		
@       =================================================

		.data
FName:	.asciz "KIEWEG.txt"
		.end
