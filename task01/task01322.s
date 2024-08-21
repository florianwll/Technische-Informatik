 .global _start

 .text
 _start:

    lw  t0, len         # t0 = len
    la  s0, list        # point s0 to first element
    lw  t1, 0(s0)       # t1 min value
    lw  t2, 0(s0)       # t2 max value

loop:
    addi s0, s0, 4      # point s0 to next element
    addi t0, t0, -1     # decrease length counter

    beq t0, zero, end   # branch if length is zero
    lw  t3, 0(s0)       # set t3 to current list element value

    bge t3, t1, notmin  # branch to notmin if t3 >= current min value
    mv  t1, t3          # set new min value

    j loop

notmin:
    ble t3, t2, notmax  # branch to notmax if t3 <= current max value
    mv  t2, t3          # set new max value

notmax:
    j   loop

end:
    mv a0, t1           # exit code
    # mv a0, t2
    li a7, 93
    ecall

.data
list:   .word 2, -5, 3, -90, 300, -54, -23, -35, 120, -54
len:    .word 10