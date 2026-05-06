@ File: StrReverseMain.s 

        .text 
        .global Start 

@       ------------------------------------------------	
@
@       StrReverse(myString1)
@
@       --------------------------------------------------

Start:
        ldr     r0, =myString1      @ r0 = Adresse des Strings
        bl      StrReverse          @ int len = StrLength(str);
        swi     0x11                @ stop

        .data
myString0: .ascii "abcdef"      @ nicht nullterminiert
myString1: .asciz "Hagenberg"   @ nullterminiert
myString2: .asciz ""            @ nullterminiert

        .align
StrLen1: .word -1
StrLen2: .word -1
        .end
