@ File: StrLength.s 

        .text 
        .global Start 

@       ------------------------------------------------	
@
@       char[] myString1 = "Hagenberg";
@       int i = 0;
@             
@       while (myString1[i] != '\0') {
@           i++;  
@       }
@             
@       --------------------------------------------------

Start:
        ldr   r1, =myString1    @ r1 = Adresse von myString1
        ldrb  r2, [r1]          @ r2 = myString1[0]
	
        mov   r0, #0            @ int i=0
Loop:		
        cmp   r2, #0            @ while (myString1[i] != '\0')
        beq   Done              @ myString1[i]=='\0': end while
		
        add   r1, r1, #1        @ r1: erhoehe baseadresse um 1 byte
        ldrb  r2, [r1]          @ lade naechstes zeichen in r2 (waere besser: ldrb  r2, [r1], #1)
        
        add   r0, r0, #1        @ i++

        b     Loop 
Done:  
        ldr   r3, =StrLen1      @ r3 = Adresse von StrLen1
        str   r0, [r3]          @ StrLen1 = i
        swi   0x11              @ stop
		
@       --------------------------------------------------

        .data
myString0: .ascii "abcdef"      @ nicht nullterminiert
myString1: .asciz "Hagenberg"   @ nullterminiert
myString2: .asciz ""            @ nullterminiert

        .align
StrLen1: .word -1
StrLen2: .word -1
        .end
