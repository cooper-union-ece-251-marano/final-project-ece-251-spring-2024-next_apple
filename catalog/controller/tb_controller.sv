//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala, Dylan Meyer O'Connor
// 
//     Create Date: 2023-02-07
//     Module Name: tb_controller
//     Description: Test bench for controller
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CONTROLLER
`define TB_CONTROLLER

`timescale 1ns/100ps
`include "controller.sv"

module tb_controller;
    parameter N = 16;
    logic [2:0] OP, FUNCT;
    logic ZERO;
    wire MEMTOREG, MEMWRITE, PCSRC, ALUSRC, REGDST, REGWRITE, JUMP;
    wire [2:0] ALUCONTROL;
    wire BRANCH;

    initial begin
        $dumpfile("controller.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t \t op = %b, \t funct = %h \t memtoreg= %h\t memwrite= %b\t pcsrc= %b\t alusrc = %b, \t regdst = %h \t regwrite= %h\t jump= %b\t branch= %b \t alucontrol= %b\t",$realtime,OP, FUNCT, MEMTOREG, MEMWRITE, PCSRC, ALUSRC, REGDST, REGWRITE, JUMP, BRANCH, ALUCONTROL);   
        end
    

    initial begin
        OP = 3'b001;
        FUNCT = 3'bx;
        ZERO = 1'b0;

        #10 
        OP = 3'b010;
        FUNCT = 3'bx;
        ZERO = 1'b0;

        #10 
        OP = 3'b101;
        FUNCT = 3'bx;
        ZERO = 1'b0;

        #10 
        OP = 3'b000;
        FUNCT = 3'b011;
        ZERO = 1'b0;

        $finish;
    end

    controller uut(.op(OP), .funct(FUNCT), .zero(ZERO), .memtoreg(MEMTOREG), .memwrite(MEMWRITE), .pcsrc(PCSRC), .alusrc(ALUSRC), .regdst(REGDST), .regwrite(REGWRITE), .jump(JUMP), .branch(BRANCH), .alucontrol(ALUCONTROL));
endmodule
`endif // TB_CONTROLLER
