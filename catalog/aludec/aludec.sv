//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: aludec
//     Description: 32-bit RISC ALU decoder
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
    input aluop,
    input funct,
    output alucontrol,
    )

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always_comb begin
        case (aluop)
            2'b00: alucontrol = 3'b010;  // add (for lw/sw/addi)
            2'b01: alucontrol = 3'b110;  // sub (for beq)
            default:
                case (funct)
                    3'b000: alucontrol = 010 // add
                    3'b001: alucontrol = 110 // sub
                    3'b010: alucontrol = 000 // and
                    3'b011: alucontrol = 001 // or
                    3'b100: alucontrol = 111 // slt
                    3'b101: alucontrol = 010 // mult
                    3'b110: alucontrol = 110 // mult
                    3'b111: alucontrol = 000 // nor



                endcase
            


        endcase
    end


endmodule

`endif // ALUDEC