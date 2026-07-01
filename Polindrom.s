.text
.global SatzPalindromMain

SatzPalindromMain:
    ldr r0, =teststring
    bl SatzPalindrom
    swi #11

EqualChars:
    push{r1, lr}
    cmp r0, #'a'
    subge r0, r0, #32 @ 'A'-'a'

    cmp r1, #'a'
    subge r1, r1, #32 @ 'A'-'a'

    cmp r0, r1
    moveq r0, #1
    movne r0, #0
    pop{r1, pc}

SatzPalindrom:
    push{r1, r2, r3, lr}

    mov r2, r0 @ left 
    mov r3, r0 @ right
    
CalcLength:
    ldrb r1, [r3], #1
    cmp r1, #0
    beq doneCalcLength
    b CalcLength
doneCalcLength:
    sub r3, r3, #2 @ size-1 and -1 weil /0 =-2

mainloop:
    cmp r2, r3 @ while left < right
    bge isPalindrom

    ldrb r0, [r2]
    cmp r0, #' '
    addeq r2, r2, #1 @ *left++
    beq mainloop

    ldrb r1, [r3] @ *right
    cmp r1, #' '
    subeq r3, r3, #1 @ *right--
    beq mainloop

    bl EqualChars
    cmp r0, #0
    beq notPalindrom

    add r2, r2, #1 @ *left++
    sub r3, r3, #1 @ *right--
    b mainloop

isPalindrom:
    mov r0, #1
    pop{r1, r2, r3, pc}
notPalindrom:
    mov r0, #0
    pop{r1, r2, r3, pc}

.data

teststring: .asciz ""

.end