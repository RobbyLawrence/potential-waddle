.section .text
.global asmfloat
asmfloat:
    fcvt.d.w    fa1, a0
    fcvt.d.s    fa0, fa0
    fsub.d      fa0, fa0, fa1
    ret
