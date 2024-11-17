.section .rodata
value1: .byte 35
value2: .short 88

.section .text
.global asmtest
asmtest:
    li t0, 9
    li a0, 9
    addi a0, t0, 5
    ret
