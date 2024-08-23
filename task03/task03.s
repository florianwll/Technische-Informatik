.global main

.data
first: .word 4, 6, 11, -4, 20, 45, -10
last: .word -13
format: .string "The maximum is %d.\n"

.text
main:
    la a1, first
    la a2, last
    jal max
    mv a1, a0
    la a0, format
    call printf
    li a0, 0
    li a7, 93
    ecall

max:
    addi sp, sp, -28
    sw ra, 28(sp)
    sw x8, 24(sp)
    sw s0, 20(sp)
    sw s1, 16(sp)
    sw s2, 12(sp)
    sw s3, 8(sp)
    sw s4, 4(sp)
    addi x8, sp, 28

    mv s0, a1
    mv s1, a2

    beq s0, s1, singleton

    sub s2, s1, s0	
    srai s2, s2, 3
    slli s2, s2, 2

    mv a1, s0
    add a2, s0, s2
    jal max
    mv s3, a0

    addi s2, s2, 4
    add a1, s0, s2
    mv a2, s1
    jal max
    mv s4, a0

    ble s3, s4, right

left:
    mv a0, s3
    j end

right:
    mv a0, s4
    j end

singleton:
    lw a0, 0(s0)

end:
    lw s4, 4(sp)
    lw s3, 8(sp)
    lw s2, 12(sp)
    lw s1, 16(sp)
    lw s0, 20(sp)
    lw x8, 24(sp)
    lw ra, 28(sp)
    addi sp, sp, 28
    ret
