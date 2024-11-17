.section .text
.global runasm
runasm:
lw      t0, 0(a0)
    ld      t1, 8(a0)
    ld      t2, 16(a0)
    sub     a0, t0, t1
    add     a0, a0, t2     
    ret
