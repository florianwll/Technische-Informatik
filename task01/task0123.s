.global _start

.text

_start:
li t0, 20
li t1, 0

loop:
    beqz t0, end    
    srl t0, t0, 1
    addi t1, t1, 1
    j loop

end:
    add a0, t1, zero
    li a7, 93          # Exit code
    ecall 