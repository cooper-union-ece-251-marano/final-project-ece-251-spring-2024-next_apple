//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: sl1
//     Description: shift left by 1 (multiply by 2)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SL1
`define SL1

`timescale 1ns/100ps

module sl1
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(n-1):0] number,
    output logic [(n-1):0] number2
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign number2 = {number[(n-2):0], 1'b0};
endmodule

`endif // SL1