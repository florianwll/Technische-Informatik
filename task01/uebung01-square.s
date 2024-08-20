# computer engineering - 2020 ss
# perimeter of quadrilateral

.globl _start

.text
_start :
la s0 , quad # load address of edge list
lw t0 , 0( s0) # load ...
lw t1 , 4( s0) #
lw t2 , 8( s0) #
lw t3 , 12( s0) # ... edges

add a0 , t0 , t1 # a0 = t0 + t1
add a0 , a0 , t2 # a0 = t0 + t1 + t2
add a0 , a0 , t3 # a0 = t0 + t1 + t2 + t3

li a7 , 93 # exit code in a0 expected
ecall # exit

.data
quad : .word 5, 11, 3, 7 # edges