//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 4/27/2024
//     Module Name: mux2
//     Description: 2:1 multiplexer
//
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MUX2
`define MUX2

`timescale 1ns/100ps

module mux2
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(n-1):0] a, b,
    input  logic select,
    output wire [(n-1):0] out
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign out = select ? a : b;
endmodule

`endif // MUX2
