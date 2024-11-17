.section .text
.global asmtest
# a0
addi    sp, sp, -32 # move stack pointer, so we can save what's in saved pointers
sd      s0, 0(sp) # array address
sd      s1, 8(sp) # size
sd      ra, 16(sp) # return address
sd      s2, 24(sp) # iterator

mv      s0, a0 # copy into s0
mv      s1, a1 # copy into s1

li      s2, 0 # i = 0

1:
bge     s2, s1, 1f
slli    t0, s2, 2
add     t0, s0, t0 # base + index*size
lw      a0, t0
j       1b
1:
# UNFINISHED!!!! Don't use this as all as fact
ld      s2, 16(sp)
ld      s1, 8(sp)
ld      s0, 0(sp)
addi    sp, sp, 32
ret
