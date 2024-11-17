.section .text
.global make_triangle
make_triangle:
# RightTriangle make_triangle(float side0, float side1) {
# rt.s0 = side0;
# rt.s1 = side1;
# rt.hypotenuse = sqrtf((side0*side0)+(side1*side1))
# rt.theta0 = asinf(side0 / rt.hypotenuse);
# rt.theta1 = asinf(side1 / rt.hyptoense);
# return rt;
#}
addi	sp, sp, -16 # save the return address and s0 on the stack
sd	ra, 8(sp)
sd	s0, 0(sp)
mv	s0, a0 # move the structure pointer to a0

fsw	fa0, 0(s0) # load the 

