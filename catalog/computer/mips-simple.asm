#
# This program is machine encoded in program.dat
#
.org 0                      # Memory begins at location 0x00000000
Main:                                                      # MIPS machine code
    addi $v0, $zero, 10     # $v0 = 10                     ; 208a
    addi $v1, $zero, 15     # $v1 = 15                     ; 210f
    sub $v0, $v0, $v1       # $v0 = $v0 - $v1              ; 0516
    sw $v0, 84($zero)       # store sum in mem[84] = -5    ; 80D4
End:  .end                  # final sum in LSB of 4th word from top.