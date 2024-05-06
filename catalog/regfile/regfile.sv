//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala and Dylan Meyer O'Connor
//
//     Create Date: 2023-02-07
//     Module Name: regfile
//     Description: 32-bit RISC register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef REGFILE
`define REGFILE

`timescale 1ns/100ps

module regfile
    // n=bit length of register; r=bit length of addr of registers
    #(parameter n = 16, parameter r = 3)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic        clock, 
    input  logic        regWrite, 
    input  logic [(r-1):0] readAddr1, readAddr2, writeAddr3, 
    input  logic [(n-1):0] writeData3, 
    output logic [(n-1):0] readData1, readData2
    );
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] registers[(2**5-1):0]; // registers is an array of 32 registers each having n-1 bits

    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clk
    // register 0 hardwired to 0
    // note: for pipelined processor, write third port
    // on falling edge of clk

    always_ff @(posedge clock)
        if (regWrite) registers[writeAddr3] <= writeData3;	

    // assign the zero register/write data to registers
    assign readData1 = (readAddr1 != 0) ? registers[readAddr1] : 0;
    assign readData2 = (readAddr2 != 0) ? registers[readAddr2] : 0;
endmodule

`endif // REGFILE
