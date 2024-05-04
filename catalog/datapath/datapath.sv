//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: datapath
//     Description: 32-bit RISC-based CPU datapath (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DATAPATH
`define DATAPATH

`timescale 1ns/100ps

`include "../regfile/regfile.sv"
`include "../alu/alu.sv"
`include "../dff/dff.sv"
`include "../adder/adder.sv"
`include "../sl1/sl1.sv"
`include "../mux2/mux2.sv"
`include "../signext/signext.sv"

module datapath
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic        clk, reset, pc_enable, //pc_enable should be 1. reset should be 0, set should be 0.
    input  logic        memtoreg, pcsrc,      //all these come from controller
    input  logic        alusrc, regdst,
    input  logic        regwrite, jump,
    input  logic [2:0]  alucontrol,
    output logic        zero,                 //where is memwrite?
    output logic [(n-1):0] pc,
    input  logic [(n-1):0] instr,
    output logic [(n-1):0] aluout, writedata,
    input  logic [(n-1):0] readdata           //comes from cpu.sv. this is what will go into $rd
);

    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [2:0]  writereg; // come from RegDst mux
    logic [(n-1):0] pcnext, pcnextbr, pcplus4, pcbranch;
    logic [(n-1):0] signimm, signimmsh; // comes from instr[6:0]
    logic [(n-1):0] srca, srcb; // comes from reg file and ALUsrc mux
    logic [(n-1):0] result; // comes from MemToReg mux

    // "next PC" logic
    dff #(n)    prog_counter(clk, 1'b0, reset, pc_enable, pcnext, pc);
    adder       pcadd2(pc, 16'b0000000000000010, 1'b0, pcplus4, cout);
    sl1         immsh(signimm, signimmsh);
    adder       pcadd22(pcplus4, signimmsh, 1'b0, pcbranch, cout2);
    mux2 #(n)   pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    mux2 #(n)   pcmux(pcnextbr, {pcplus4[15:14], instr[12:0], 1'b0}, jump, pcnext);

    // register file logic
    regfile     registers(clk, regwrite, instr[12:10], instr[9:7], writereg, result, srca, writedata);
    mux2 #(3)   wrmux(instr[9:7], instr[6:4], regdst, writereg);
    mux2 #(n)   resmux(aluout, readdata, memtoreg, result);
    signext     se(instr[6:0], signimm);

    // ALU logic
    mux2 #(n)   srcbmux(writedata, signimm, alusrc, srcb);
    alu         alu(srca, srcb, alucontrol, aluout, zero);  



endmodule

`endif // DATAPATH
