.globl main

.data
format:     .string "%d\n"

.text
main:
    li      a0, 5
    jal     foobar
    mv      a1, a0
    la      a0, format
    call    printf
    li      a0, 0
    li      a7, 93
    ecall

foobar:
    addi    sp, sp, -8
    sw      x8, 8(sp)
    sw      s0, 4(sp)
    addi    x8, sp, 8
    li      s0, 0
foo:
    beqz    a0, bar
    add     s0, s0, a0
    addi    a0, a0, -1
    j       foo
bar:
    mv      a0, s0
    lw      s0, 4(sp)
    lw      x8, 8(sp)
    addi    sp, sp, 8
    ret
