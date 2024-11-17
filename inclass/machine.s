.section .text
.global asmtest
asmtest:
    li x4, 8
    .word 0x00221113
    mv a0, x2
    ret
