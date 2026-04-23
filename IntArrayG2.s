@ File: IntArrayG2.s

@ Sucht das Maximum in einem Integerarrays (länge >= 1).

@ int maximum = IntArray[0];
@ for (int i=1; i < n; i++)
@     if (IntArray[i] > maximum)
@         maximum = IntArray[i];

        .text 
        .global Maximum

Maximum:
    ldr r1, =n          @ Lade Adresse von n
    ldr r1, [r1]        @ r1: n

    ldr r2, =IntArray   @ Lade Basisadresse IntArray (r2)
    ldr r0, [r2]        @ r0: int maximum = IntArray[0];

    mov r3, #1          @ r3: int i = 1

ForLoop:
    cmp r3, r1          @ for (int i=1; i < n; i++)
    bge EndFor          @ Ende wenn i>=n

    add r2, r2, #4      @ r2: Pointer auf intarray[i]
    ldr r4, [r2]        @ Lade intarray[i]

    cmp r4, r0          @ if (IntArray[i] > maximum)
    ble next

    mov r0, r4          @ maximum = IntArray[i];
next:
    add r3, r3, #1
    b   ForLoop

EndFor:


        .data
n:          .word 10
IntArray:   .word 1,2,3,-4,5,6,7,8,-9,10
Maximum:    .word 0
        .end