//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: sl2
//     Description: shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SL2
`define SL2

`timescale 1ns/100ps

module sl2
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(n-1):0] number,
    output logic [(n-1):0] number4
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    assign number4 = {number[(n-3):0], 2'b00};
endmodule

`endif // SL2