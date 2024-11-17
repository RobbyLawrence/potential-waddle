# Name: Robby Lawrence
# NetID: rlawren9
# Student ID: 000691931
# Lab: Multi-User Dungeon
.section .rodata
exit_string: 	.asciz "%s\n%s\nExits: "
newline: 	.asciz "\n"
north_exit: 	.asciz "n "
east_exit:	.asciz "e "
south_exit:	.asciz "s "
west_exit:	.asciz "w "

.section .text
.global look_at_room
.global look_at_all_rooms
.global move_to

# void look_at_room(const Room *r)
look_at_room:
    addi sp, sp, -16 # move stack pointer so we can save return address and s0
    sd ra, 8(sp)
    sd s0, 0(sp)
    mv s0, a0 # save *r in s0
    la a0, exit_string # load exit_string address
    ld a1, 0(s0) # load struct elements
    ld a2, 8(s0)
    call printf # call printf

    lw t0, 16(s0) # load exits[0] into t0
    li t1, -1
    # if t0 is equal to t1, then there's NOT an exit for a given direction
    beq	t0, t1, 1f # skip the next two lines if equal
    la a0, north_exit
    call printf # print exit

1: # do the same thing for east exit
    li t1, -1
    lw t0, 20(s0)
    beq t0, t1, 1f
    la a0, east_exit
    call printf
1: # same thing for south exit
    li t1, -1
    lw t0, 24(s0)
    beq t0, t1, 1f
    la a0, south_exit
    call printf
1: # same thing for west exit
    li t1, -1
    lw t0, 28(s0)
    beq t0, t1, 1f
    la a0, west_exit
    call printf
1: # final line that we have to print
    la a0, newline
    call printf
    ld ra, 8(sp) # put everything back where we found it
    ld s0, 0(sp)
    addi sp, sp, 16
    ret

# void look_at_all_rooms(const Room *rooms, int num_rooms)
look_at_all_rooms:
    addi sp, sp, -32 # move the stack pointer and save s0-s2
    sd ra, 24(sp)
    sd s0, 16(sp)
    sd s1, 8(sp)
    sd s2, 0(sp)
    mv s0, a0 # copy *rooms and num_rooms into saved registers
    mv s2, a1
    li s1, 0 # counter

1:
    bge s1, s2, 1f # if num_rooms <= counter, jump
    li t0, 32
    mul t1, s1, t0
    add a0, s0, t1 # address = base + index*size
    call look_at_room # reuse function so we don't have to write it again
    la a0, newline
    call printf
    addi s1, s1, 1 # counter++
    j 1b
1:
    ld ra, 24(sp) # put everything back once done
    ld s0, 16(sp)
    ld s1, 8(sp)
    ld s2, 0(sp)
    addi sp, sp, 32
    ret
# Room *move_to(Room *rooms, const Room *current, int direction)
move_to:
    slli t0, a2, 2 # get exit room number for given direction
    add t0, a1, t0
    addi t0, t0, 16 # add offset to exits
    lw t1, 0(t0)
    li t2, -1
    beq t1, t2, 1f # if exit[direction] is -1, jump
    li t0, 32
    mul t1, t1, t0 # total number of bytes
    add a0, a0, t1
    ret
1:
    mv a0, zero # jump here if the direction is -1
    ret
