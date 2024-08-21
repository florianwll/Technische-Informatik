.global _start

.text
_start:

la s0, list
la s1, len 
lw t0, 0(s1)    # length
li t1, 0        # i counter
li t2, 0        # neg counter

loop:
    bge t1, t0, end
    lw t3, 0(s0)
    slt t4, t3, zero
    add t2, t2, t4
    addi t1, t1, 1
    addi s0, s0, 4
    j loop



end:
    add a0, t2, zero
    li a7, 93
    ecall

.data
list: .word 2, -5, 3, -90, 300, -54, -23, -35, 120, -54
len: .word 10