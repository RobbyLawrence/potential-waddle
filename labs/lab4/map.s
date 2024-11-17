
.section .text
.global map
# void map(double values[],
#	   uint64_t num_values,
#	   double (*mapping_func)(double left, double right),
#	   double map_value) {
#	uint64_t i;
#	for (i=0;i<num_values) {
#		values[i] = mapping_func(values[i], map_value);
#		}
#}
map:
	addi	sp, sp, -80 # shift the stack pointer up by 48 bytes so we can save the s registers we'll be using
	# store the s registers
	sd	a0, 72(sp)
	sd	a1, 64(sp)
	sd	a2, 56(sp)
	fsd	fa0, 48(sp)
	sd	ra, 40(sp)
	sd	s0, 32(sp)
	sd	s3, 24(sp)
	sd	s4, 16(sp)
	sd	s5, 8(sp)	
	fsd	fs0, 0(sp) # we DO have to put these back later
	# put everything in the s registers now
	fmv.d   fs0, fa0 # map_value	
	mv	s3, a2 # mapping_func memory address
	mv	s4, a1 # num_values
	li	s5, 0 # i = 0 for loop
	mv	s0, a0 # values[] memory address


1:	# start the loop
	bge s5, s4, 1f # jump to 1f if s3 is greater than or equal to num_values
	slli t0, s5, 3 # t0 is now i * 8
	add t0, s0, t0 # this is the address of any given element of values[i]
	fld fa0, 0(t0) # load the value in the address calculated in t0
	fmv.d fa1, fs0 # move map_value into fa1
	jalr s3 # not 100% sure how this instruction works
	fsd fa0, 0(t0) # put the result in the address we calculated in s4
	# increment counter and jump back
	addi s5, s5, 1
	j 1b
1: # we're done now with the meat of the program, we just have to clean up now
		# load all the values in the s registers back
	ld ra, 40(sp)
	ld s0, 32(sp)
	ld s3, 24(sp)
	ld s4, 16(sp)
	ld s5, 8(sp)
	fld fs0, 0(sp)
	addi sp, sp, 80 # move the stack pointer back



.global map_add
#double map_add(double left, double right) {
#	return left + right;
#}
map_add:
	fadd.d fa0, fa0, fa1
	ret

.global map_sub
#double map_sub(double left, double right) {
#	return left - right;
#}
map_sub:
	fsub.d fa0, fa0, fa1
	ret

.global map_min
#double map_min(double left, double right) {
#	if (left < right) return left;
#	else return right;
#}
	fmin.d fa0, fa0, fa1
	ret
map_min:

.global map_max
#double map_max(double left, double right) {
#	if (left > right) return left;
#	else return right;
#}
map_max:
	fmax.d fa0, fa0, fa1
	ret
