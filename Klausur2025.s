.text
.global AsciiToDec, Str2Dec

AsciiToDec:
    cmp r0, #'0'
    blt notDigit
    cmp r0, #'9'
    bgt notDigit
    sub r0, r0, #'0'
    mov pc, lr
notDigit:
    mov r0, #-1
    mov pc, lr


Str2Dec:
    push{r1, r2, lr}
    mov r2, #0
    mov r1, r0
loop:
    ldrb r0, [r1]
    cmp r0, #0
    beq done
    bl AsciiToDec
    cmp r0, #-1
    beq fault
    mul r2, r2, #10
    add r2, r2, r0
    add r1, r1, #1
    b loop
fault:
    mov r0, #-1
    pop{r1, r2, pc}
done:
    mov r0, r2
    pop{r1, r2, pc}