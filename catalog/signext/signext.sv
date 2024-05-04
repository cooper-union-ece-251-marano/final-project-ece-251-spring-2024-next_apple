//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 4/28/2024
//     Module Name: signext
//     Description: 8 to 16 bit sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SIGNEXT
`define SIGNEXT

`timescale 1ns/100ps

module signext
    #(parameter n = 16, i = 7)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(i-1):0] a,
    output logic [(n-1):0] out
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign out = { {n{a[(i-1)]}}, a}; // sign extend (i-1)th bit i bits to the left.
endmodule

`endif // SIGNEXT
