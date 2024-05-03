//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: maindec
//     Description: 32-bit RISC-based CPU main decoder (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MAINDEC
`define MAINDEC

`timescale 1ns/100ps

module maindec
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [2:0] op,
    output logic       memtoreg, memwrite,
    output logic       branch, alusrc,
    output logic       regdst, regwrite,
    output logic       jump,
    output logic [1:0] aluop
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [8:0] controls; // 9-bit control vector

    // controls has 9 logical signals
    assign {regwrite, regdst, alusrc, branch, memwrite,
            memtoreg, jump, aluop} = controls;
    //alu ops: 00 --> add for lw, sw, addi, (j?)
    //	       01 --> sub for beq
    //	       11 --> rtype (normal alu operation w 2 read regs)

    always @* begin
        case(op)
            3'b000: controls <= 9'b111000011; // rtype - rw,rd, alusrc == true
            3'b001: controls <= 9'b100000000; // addi - rw true (alusrc,rd false)
            3'b010: controls <= 9'b000100001; // beq - 
            3'b011: controls <= 9'b101001000; // lw - rw,mem2reg true
            3'b100: controls <= 9'b001010000; // sw - memwrite true
            3'b101: controls <= 9'b000000100; // j   --alu op? would it be 00?bc add
            default:   controls <= 9'bxxxxxxxxx; // illegal operation
        endcase
    end

endmodule

`endif // MAINDEC
