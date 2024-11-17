.section .text
.global asmtest
asmtest: #   asmtest(double fa0, float fa1, int a0)
    fcvt.d.s    fa1,    fa1 #.d is for double, .s is for single precision (float)
    fcvt.d.w    fa2,    a0 #.w is for word (int)

    fmul.d      fa0,    fa0,    fa1
    fadd.d      fa0,    fa0,    fa2
    fcvt.s.d    fa0,    fa0
    ret
