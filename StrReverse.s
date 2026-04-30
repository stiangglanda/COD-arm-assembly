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
        push    {r1, r2, r3}        @ Register retten
        ldr     r0, =myString1      @ r0 = Adresse des Strings
        mov     r1, r0              @ char* start = str;
        bl      StrLen              @ int len = StrLength(str);
        add     r2, r1, r0          @ char* end = str + len;

while:
        cmp     r1, r2              @ while (start < end)
        bge     Done;

        mov     r3, [r1]
        str     [r1], [r2]
        str     [r2], r3

        add     r1, r1, #1
        sub     r2, r2, #1

        b       while 
Done:  
        pop     {r1, r2, r3}        @ Register restaurieren
        mov     pc, lr              @ return
		
@       --------------------------------------------------

        .data
myString0: .ascii "abcdef"      @ nicht nullterminiert
myString1: .asciz "Hagenberg"   @ nullterminiert
myString2: .asciz ""            @ nullterminiert

        .align
StrLen1: .word -1
StrLen2: .word -1
        .end
