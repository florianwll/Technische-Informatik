.global _start

.text
_start:

    li t0, 15
    li t1, 20
    slt t2, t0, t1
    beq t2, zero, a_greater_than_b

    sub t3, t1, t0
    j end_if

a_greater_than_b:
    sub t3, t1, t0

end_if:
    add a0, t3, zero
    li a7, 93
    ecall