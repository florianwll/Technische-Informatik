.global _start

.text
_start:
    la s0, list
    la s1, last
    li a0, 0 # counter


 
loop:
    beq s0, s1, end
    addi a0, a0, 1
    addi s0, s0, 4
    j loop
end:
    li a7, 93         # Exit-Systemaufruf
    ecall             # Beende das Programm




.data
list:   .word 2, -5, 3, -90, 300, -54, -23, -35, 120,
last:   .word -54