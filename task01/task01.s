.globl _start

.text
_start:
    la s0, quad        # Load address of edge list into s0
    li a0, 0           # Initialize the sum (perimeter) in a0
    la s1, end         # Load the address of the end label into s1

loop:
    beq s0, s1, end    # If s0 reaches the address in s1, end the loop
    lw t0, 0(s0)       # Load the current edge into t0
    add a0, a0, t0     # Add the current edge to the sum
    addi s0, s0, 4     # Move to the next edge in memory
    j loop             # Jump back to the start of the loop

end:
    li a7, 93          # Exit code
    ecall              # Exit

.data
quad: .word 5, 11, 3, 7  # Define the edges of the quadrilateral
