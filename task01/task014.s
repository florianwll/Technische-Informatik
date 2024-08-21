.global _start

.text
_start:
            la  s0, checker         # load checker void
            lb  t0, 0(s0)           # first stored byte
            lb  t1, 1(s0)           # next strored byte

            sub t2, t0, t1          # t2 < 0 if t1 > t0
            blt t2, zero, little    # branch if t2 < 0, i.e. t1=02, t0=01

big:        
            li  a0, 1               # 1 = stdout
            la  a1, big_msg         # print big-endian
            li  a2, 11              # length of string
            j   finish

little:
            li a0, 1
            la a1, little_msg
            li a2, 14

finish:
            li a7, 64               # linux write system call
            ecall

            li a0, 0
            li a7, 93
            ecall

.data
checker: .word  0x0201
little_msg:     .ascii  "little-endian\n"
big_msg:        .ascii  "big-endian\n"