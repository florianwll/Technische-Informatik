.global main

.data
format: .string "%d\n"

.text
main:
    li  a0, 5
    jal sumfunction
    mv  a1, a0
    la  a0, format
    call printf
    li  a0, 0
    li  a7, 93
    ecall

sumfunction:
    addi sp, sp, -16
    sw x8, 8(sp)
    sw s0, 4(sp)
    addi x8, sp, 8
    li s0, 0

loop:
    beqz a0, end
    add s0, s0, a0
    addi a0, a0, -1
    j loop

end:
    mv a0, s0
    lw x8, 8(sp)
    lw s0, 4(sp)
    addi sp, sp, 8
    ret

    