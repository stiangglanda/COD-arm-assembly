@ File: IntArrayG2.s

@ Sucht das Maximum in einem Integerarrays (länge >= 1).

@ int maximum = IntArray[0];
@ for (int i=1; i < n; i++)
@     if (IntArray[i] > maximum)
@         maximum = IntArray[i];

        .text 
        .global Maxi

Maxi:
    ldr r1, =n          @ Lade Adresse von n
    ldr r1, [r1]        @ r1: n

    ldr r2, =IntArray   @ Lade Basisadresse IntArray (r2)
    ldr r0, [r2]        @ r0: int maximum = IntArray[0];

    mov r3, #1          @ r3: int i = 1

ForLoop:
    cmp r3, r1          @ for (int i=1; i < n; i++)
    bge EndFor          @ Ende wenn i>=n

    ldr r4, [r2 #4]!    @ Lade intarray[i]

    add r3, r3, #1      @ i++

    cmp r4, r0          @ if (IntArray[i] > maximum)
    movgt r0, r4        @ maximum = IntArray[i];
    
    b   ForLoop

EndFor:

    ldr r3, =Maximum
    str r0, [r3]        @ Ergebnis r0 nach Maximum speichern

    swi 0x11            @ stop


        .data
n:          .word 10
IntArray:   .word 1,2,3,-4,5,6,7,8,-9,10
Maximum:    .word 0
        .end