.global _start

.text
_start:
    la s0, list
    la s1, last
    li t0, zero # counter

    lw t2, 0(s1)
 
loop:
    lw t1, 0(s0)      # Lade das aktuelle Element in t1
    addi t0, t0, 1    # Erhöhe den Zähler um 1
    addi s0, s0, 4    # Gehe zum nächsten Element in der Liste
    bne t1, t2, loop  # Solange t1 (aktuelles Element) ungleich t2 (letztes Element) ist, wiederhole die Schleife

end:
    add a0, t0, zero
    li a7, 93         # Exit-Systemaufruf
    ecall             # Beende das Programm




.data
list:   .word 2, -5, 3, -90, 300, -54, -23, -35, 120,
last:   .word -54