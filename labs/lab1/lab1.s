.section .text
.global sum_prod
sum_prod:
    # int32_t (a0)
    #   sum_prod
    #       const int32_t values[] (a0)
    #       uint64_t num_values    (a1)
    #       int32_t &product       (a2)
    # Rewritten:
    # a0        sum_prod (a0, a1, a2)
    li   t0, 0 # use t0 for the sum
    li   t1, 1 # use t1 for the product
    li   t2, 0 # use for the iterator (i)

1: # backwards
    bge  t2, a1, 1f # checks if the iterator equals the number of values in the vector
    slli t3, t2, 2 # multiply the iterator by 4
    add  t3, t3, a0 # t3 = &values[i]
    lw   t4, 0(t3)
    add  t0, t0, t4 # add number to accumulating sum
    mul  t1, t1, t4 # multiply number by accumulating product
    addi t2, t2, 1 # increment the iterator
    j    1b # keeps the machine in the loop
1: # forwards

    mv a0, t0 # copy temp register to output register
    sw t1, 0(a2) # return accumulating product into a2
    ret
