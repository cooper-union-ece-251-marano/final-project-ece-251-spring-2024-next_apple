//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 4/30/2024
//     Module Name: aludec
//     Description: 16-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aludec
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input [1:0] aluop,
    input [2:0] funct,
    output reg [2:0] alucontrol
    );

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
     
    always_comb begin
        case (aluop)
            2'b00: alucontrol = 3'b010;  // add (for lw/sw/addi)
            2'b01: alucontrol = 3'b110;  // sub (for beq)
            default:
                case (funct)
                    3'b000: alucontrol = 000; // and
                    3'b001: alucontrol = 001; // or
                    3'b010: alucontrol = 010; // add
                    3'b011: alucontrol = 011; // sll
                    3'b100: alucontrol = 100; // slr
                    3'b101: alucontrol = 101; // not
                    3'b110: alucontrol = 110; // sub
                    3'b111: alucontrol = 111; // slt



                endcase
            


        endcase
    end



endmodule

`endif // ALUDEC
