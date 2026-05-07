@ File: copyStr.s 

        .text 
        .global copyStr 

@		-------------------------------------------------
@
@               int copyStr(char *source, char *target) {
@                       while(*source != '\0') {
@                               if (*target == '\0') {
@                                       return -1;
@                               }
@                               *target++ = *source;
@                               source++;
@                       }
@                       *target = '\0';
@
@                       return 0;
@               }
@                 
@		-------------------------------------------------


copyStr:                              @ r0 = char *source, r1 = char *target
        push    {r2, r3, lr}          @ Register retten      maybe remove lr?
while:
        ldrb    r2, [r0]              @ r2 = *source
        cmp     r2, #0                @ while(*source != '\0')
        beq     Done

        ldrb    r3, [r1]              @ r3 = *target
        cmp     r3, #0                @ if (*target == '\0')
        moveq   r0, #-1               @ return -1
        beq     Return

        strb    r2, [r1], #1          @ *target++ = *source;
        add     r0, r0, #1            @ source++
        b       while
Done:  
        mov     r0, #0                @ return 0;
        strb    r0, [r1]              @ *target = '\0';
Return:
        pop     {r2, r3, lr}          @ Register restaurieren
        mov     pc, lr                @ return
		
@		-------------------------------------------------

        .end