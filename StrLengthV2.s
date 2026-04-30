@ File: StrLengthUpro.s

@ char *ptr
@ ptr = r0;
@ r1
@ while (*ptr++!=0);
@ r0 = ptr-chArray-1;

        .text
        .global StrLen

@       ------------------------------------------------
@
@       char *ptr = r0;        @ Eingabe: Adresse des Strings in r0
@       int len = 0;
@
@       while (*ptr++ != '\0') ;
@
@       r0 = ptr - startAddr - 1;   @ Ergebnis (Länge) in r0
@
@       ------------------------------------------------

StrLen:
        push    {r1, r2}            @ Register retten
        mov     r1, r0              @ Startadresse retten

Loop:
        ldrb    r2, [r0], #1        @ r2 := *ptr; Lese Buchstaben, ptr++
        cmp     r2, #0
        bne     Loop

        sub     r0, r0, r1          @ ptr - chArray
        sub     r0, r0, #1          @ Ergebnis in R0

        pop     {r1, r2}            @ Register restaurieren
        mov     pc, lr              @ return

        .end