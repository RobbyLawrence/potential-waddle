.section .text
.global asmtest
asmtest:
    # long asmtest(MyStruct &ms)
    # a0   asmtest(a0)
    #
    # N O  S
    # i 0  4
    # j 8  8
    # k 16 2
    # Size = 24 bytes
addi a0, a0, 48
li  t0, 100
sw  t0, 0(a0)
li  t1, 200
sd  t1, 8(a0)
li  t2, 300
sh  t2, 16(a0)
# here, we flip from getting information from a0 to storing
mul a0, t0, t1
add a0, a0, t2

ret
