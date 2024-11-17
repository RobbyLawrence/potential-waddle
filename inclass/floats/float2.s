.section .text
.global asmtest
asmtest: #void asmtest(double *i, float *j(
    fld     ft0, 0(a0)
    flw     ft1, 0(a1)
    fcvt.s.d    ft0, ft0
    fcvt.d.s    ft1, ft1
    fsd     ft1, 0(a0)
    fsw     ft0, 0(a1)
    ret
