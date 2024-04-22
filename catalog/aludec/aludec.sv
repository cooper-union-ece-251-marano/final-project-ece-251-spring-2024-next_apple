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
    #(parameter n = 32)(
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
    always @ (aluop, funct) begin
        casez (aluop)
            00: alucontrol = 010;  // add
            ?1: alucontrol = 110;  // sub
            1?: begin
                case (funct)
                    000: alucontrol = 010 // add
                    001: alucontrol = 110 // sub
                    010: alucontrol = 000 // and
                    011: alucontrol = 001 // or
                    100: alucontrol = 111 // slt
                    101: alucontrol = 010 // mult
                    110: alucontrol = 110 // nand
                    111: alucontrol = 000 // nor



                endcase
            end


        endcase
    end


endmodule

`endif // ALUDEC