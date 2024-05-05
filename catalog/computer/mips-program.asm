# mipstest.asm
# David_Harris@hmc.edu, Sarah_Harris@hmc.edu 31 March 2012
#
# Test the MIPS processor.
# add, sub, and, or, slt, addi, lw, sw, beq, j
# If successful, it should write the value 7 to address 84
#       Assembly            Description             Address     Machine
main:   addi $2, $0, 5      # initialize $2 = 5     00          20020005
        addi $3, $0, 12     # initialize $3 = 12    02          2003000c
        addi $7, $3, −9     # initialize $7 = 3     04          2067fff7
        or $4, $7, $2       # $4 = (3 OR 5) = 7     06          00e22025
        and $5, $3, $4      # $5 = (12 AND 7) = 4   08          00642824
        add $5, $5, $4      # $5 = 4 + 7 = 11       0a          00a42820
        beq $5, $7, end     # shouldn't be taken    0c          10a7000a
        slt $4, $3, $4      # $4 = 12 < 7 = 0       0e          0064202a
        beq $4, $0, around  # should be taken       10          10800001
        addi $5, $0, 0      # shouldn’t happen      12          20050000
around: slt $4, $7, $2      # $4 = 3 < 5 = 1        14          00e2202a
        add $7, $4, $5      # $7 = 1 + 11 = 12      16          00853820
        sub $7, $7, $2      # $7 = 12 − 5 = 7       18          00e23822
        sw $7, 68($3)       # [80] = 7              20          ac670044
        lw $2, 80($0)       # $2 = [80] = 7         22          8c020050
        j end               # should be taken       24          08000011
        addi $2, $0, 1      # shouldn't happen      26          20020001
end:    sw $2, 84($0)       # write mem[84] = 7     28          ac020054