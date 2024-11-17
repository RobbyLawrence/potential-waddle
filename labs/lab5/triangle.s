# Name: Robby Lawrence
# NetID: rlawren9
# StudentID: 000691931
# Lab: Right Triangle
# Description: Creates a right triangle object, loads the object, and returns the different
# sides and angles of the created triangle.

.section .text
.global make_triangle
make_triangle:
    addi    sp, sp, -16 # store ra and s0 on the stack
    sd      s0, 8(sp)
    sd      ra, 0(sp)
    mv      s0, a0
    fsw     fa0, 0(s0) # store the side0 parameter in first float slot
    fsw     fa1, 4(s0) # store the side1 parameter in second float slot
    fmul.s  ft0, fa0, fa0 # square sides and store temp
    fmul.s  ft1, fa1, fa1
    fadd.s  fa0, ft0, ft1 # add, then take square root to get hypotenuse
    call    sqrtf              # take the square root of fa0
    fsw     fa0, 8(s0)         # store
    # find theta0
    fmv.s   ft2, fa0           # mv 
    flw     fa0, 0(s0)         # fa0 = side0
    fdiv.s  fa0, fa0, ft2      # fa0 = side0 / hypot
    call    asinf              # function call
    fsw     fa0, 12(s0)        # store the angle
    # we're basically doing the same thing again, just with side1 instead of side0
    flw     fa0, 4(s0)
    fdiv.s  fa0, fa0, ft2
    call    asinf
    fsw     fa0, 16(s0)
    # clean up
    mv      a0, s0 # we need to return the pointer to the structure
    ld      ra, 0(sp) # reload saved register and return address
    ld      s0, 8(sp)
    addi    sp, sp, 16 # put the stack pointer back
    ret
