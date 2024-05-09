//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala, Dylan Meyer O'Connor
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: simple behavorial adder. For 
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

`timescale 1ns/100ps

module adder
    #(parameter n = 16)(
        input [n-1:0] a,
        input [n-1:0] b,
        input cin,
        output reg [n-1:0] sum,
        output reg cout
    //
    // ---------------- PORT DEFINITIONS ----------------
    //

);

    always_comb 
        {cout, sum} = a + b + cin;
    

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //

endmodule

`endif // ADDER
