#
# This program is machine encoded in program.dat
#
.org 0                      # Memory begins at location 0x00000000
Main:                                                      # MIPS machine code
    addi $3, $zero, 8     # n = 8                          ; 208a
    addi $4, $zero, 1     # f1 = 1                         ; 210f
    addi $5, $0, -1       # f2 = -1                        ; 0516
loop:
    beq $3, $zero, end    # done with loop if n = 0        ; 80D4
    add $4, $4, $5        # f1 = f1 + f2
    sub $5, $4, $5        # f2 = f1 - f2
    addi $3, $3, -1       # n = n - 1
    j loop                # repeat until done
end:  
    sw $4 64($0)          # store result in address 64 of memory
    .end                  