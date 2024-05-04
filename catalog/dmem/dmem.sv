//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 4/28/2024
//     Module Name: dmem
//     Description: 16-bit RISC memory ("data" segment)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DMEM
`define DMEM

`timescale 1ns/100ps

module dmem
// n=bit length of register; r=bit length of addr to limit memory and not crash your verilog emulator
    #(parameter n = 16, parameter r = 6)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic clock, memWrite,         //write enable
    input  logic [(n-1):0] addr, writeData, 
    output logic [(n-1):0] readData
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] RAM[(2**r-1):0];

    assign readData = RAM[addr[(n-1):2]]; // word aligned (ignores lower 2 bits of address)

    always_ff @(posedge clk) // write on posedge
        if (memWrite) RAM[addr[(n-1):2]] <= writeData;

endmodule

`endif // DMEM
