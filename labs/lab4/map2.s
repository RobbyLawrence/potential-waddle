# Name: Robby Lawrence
# Lab: Floating Point Program
# Course: COSC 230, Fall 2024, Stephen Marz
.section .text
.global map
.global map_add
.global map_sub
.global map_min
.global map_max

map:
    # Save callee-saved registers
    addi sp, sp, -48
    sd ra, 40(sp)
    sd s0, 32(sp)
    sd s3, 24(sp)
    sd s4, 16(sp)
    sd s5, 8(sp)
    fsd fs0, 0(sp)

    # Set up registers as per template
    fmv.d   fs0, fa0       # Move map_value into fs0
    mv      s3, a2         # mapping_func address is now in s3
    mv      s4, a1         # Move num_values into s4
    li      s5, 0          # uint64_t i
    mv      s0, a0         # s0 = values[]

1:
    bge     s5, s4, 1f     # Jump out if i >= num_values
    
    # Setup fa0 (values[i])
    slli    t0, s5, 3      # t0 = i * 8 (each double is 8 bytes)
    add     t0, s0, t0     # t0 = &values[i]
    fld     fa0, 0(t0)     # fa0 = values[i]
    
    fmv.d   fa1, fs0       # Set double right = map_value
    jalr    s3             # mapping_func(fa0, fa1)
    
    # Store fa0, the return value, back into values[i]
    slli    t0, s5, 3      # t0 = i * 8 (each double is 8 bytes)
    add     t0, s0, t0     # t0 = &values[i]
    fsd     fa0, 0(t0)     # values[i] = fa0 (result)
    
    addi    s5, s5, 1      # i++
    j       1b             # Loop again

1:  # Loop end
    # Restore callee-saved registers
    ld ra, 40(sp)
    ld s0, 32(sp)
    ld s3, 24(sp)
    ld s4, 16(sp)
    ld s5, 8(sp)
    fld fs0, 0(sp)
    addi sp, sp, 48
    ret

map_add:
    fadd.d fa0, fa0, fa1
    ret

map_sub:
    fsub.d fa0, fa0, fa1
    ret

map_min:
    fmin.d fa0, fa0, fa1
    ret

map_max:
    fmax.d fa0, fa0, fa1
    ret
