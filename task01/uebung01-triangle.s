
.globl _start

.text
_start :
la s0 , tria # load address of edge list
lw t0 , 0( s0) # load ...
lw t1 , 4( s0) #

addi a0 , a0, 180
sub a0 , a0 , t0 
sub a0 , a0 , t1 
li a7 , 93 # exit code in a0 expected
ecall # exit

.data
tria : .word 50, 30