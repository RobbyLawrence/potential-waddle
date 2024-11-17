# int64_t get_rand(int64_t mn, int64_t mx) {
#    return mn + rand() % (mx - mn + 1);
# }

# Registers:
# a0 get_rand(a0 mn, a1 mx) {
#    return mn + rand() % (mx - mn + 1);
# }
.section .text
.global get_rand
get_rand:
	addi    sp, sp, -32      # ra + s0 + s1 = 24 bytes aligned to 32
	sd	ra, 0(sp) # store saved registers
	sd 	s0, 8(sp)
	sd 	s1, 16(sp)
	mv	s0, a0 # move in the a registers into saved registers
	mv 	s1, a1
	call 	rand # calling rand()
	sub 	t0, s1, s0 # use temp registers to make the calculations
	addi 	t0, t0, 1
	rem	t1, a0, t0 # t1 = rand() % (mx - mn + 1)
	add 	a0, s0, t1 # a0 = mn + rand() % (mx-mn+1)
	ld 	ra, 0(sp) # reload saved registers from the stack
	ld	s0, 8(sp)
	ld	s1, 16(sp)
	addi	sp, sp, 32 # deallocate
	ret
