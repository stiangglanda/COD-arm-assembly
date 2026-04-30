@ File: StrReverse.s 

        .text 
        .global Start 

@       ------------------------------------------------	
@
@   void StrReverse(char* str) {
@       int len = StrLength(str);
@       char* start = str;
@       char* end = str + len;
@
@       while (start < end) {
@           char temp = *start;
@           *start = *end;
@           *end = temp;
@
@           start++;
@           end--;
@       }    
@   }
@       --------------------------------------------------

Start:
        ldr     r0, =myString1      @ r0 = Adresse des Strings
        mov     r1, r0              @ char* start = str;
        bl      StrLen              @ int len = StrLength(str);
        add     r2, r1, r0          @ char* end = str + len;

while:
        cmp     r1, r2              @ while (start < end)
        bge     Done;
        

        ldr   r1, =myString1    @ r1 = Adresse von myString1
        mov   r4, r1            @ r4 = Base Address von myString1

        ldrb  r2, [r1]          @ r2 = myString1[0]

Loop:		
        cmp   r2, #0            @ while (myString1[i] != '\0')
        beq   Done              @ myString1[i]=='\0': end while
		
        ldrb  r2, [r1, #1]!     @ r2 = myString1[i++]

        b     Loop 
Done:  
        sub   r0, r1, r4        @ Länge berechnen: Endadresse (r1) - Startadresse (r4)
        ldr   r3, =StrLen1      @ r3 = Adresse von StrLen1
        str   r0, [r3]          @ StrLen1 = Länge
        @ pop {r1, r2}
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
