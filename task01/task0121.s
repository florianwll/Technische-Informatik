.global _start

.text
_start:
    li t0, -7           # Laden Sie den Wert -7 in t0 (dies ist 'a')
    slt t1, t0, zero    # Setzen Sie t1 auf 1, wenn t0 < 0 ist (a < 0), sonst auf 0
    beq t1, zero, end_if # Wenn t1 0 ist (a >= 0), überspringen Sie die Negation
    sub t0, zero, t0    # Negieren Sie t0 (a = -a), wenn a < 0

end_if:
    # Hier könnten Sie den Wert von t0 ausgeben, falls gewünscht
    add a0, t0, zero
    li a7, 93
    ecall  