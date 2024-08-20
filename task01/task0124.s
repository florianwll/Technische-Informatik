.global _start

.text

_start:
    li t0, 2           # Example value for x
    li t1, 3           # Example value for k
    li t2, 1           # z = 1
    li t3, 0           # i = 0

loop:
    bge t3, t1, end
    mul t2, t2, t0
    addi t3, t3, 1
    j loop

end:
    add a0, t2, zero
    li a7, 93
    ecall