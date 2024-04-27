//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer O'Connor, Lamiya Rangwala
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU

`timescale 1ns/100ps

module alu
    #(parameter n = 16)(

    // ---------------- PORT DEFINITIONS ----------------------------
    input [n-1:0] srcA, srcB,
    input [2:0] alucontrol,
    output reg [n-1:0] out
    );

    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    always_comb begin
        case (alucontrol) 
            3'b000: out = srcA & srcB;            // and
            3'b001: out = srcA | srcB;            // or
            3'b010: out = srcA + srcB;             // add
            3'b011: out = srcA << srcB;            //  sll
            3'b100: out = srcA ~& srcB;         // nand
            3'b101: out = srcA ~| srcB;         // nor
            3'b110: out = srcA - srcB;             // sub
            3'b111: out = (srcA < srcB) ? 0 : 1;   // slt
        endcase

    end


    

endmodule

`endif // ALU
