//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_cpu
//     Description: Test bench for cpu
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CPU
`define TB_CPU

`timescale 1ns/100ps
`include "cpu.sv"
`include "../clock/clock.sv"

module tb_cpu;
    parameter N = 16;
    logic RESET;
    logic [(N-1):0] INSTR, READDATA;
    wire [(N-1):0] PC, ALUOUT, WRITEDATA;
    wire MEMWRITE;
    logic CLK_ENABLE;
    logic CLK;

    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, dut1,uut);
        $monitor("time=%0t \t reset = %b \t instr = %h \t readdata= %h\t pc= %h\t memwrite= %b\t aluout = %h \t writedata = %h",$realtime, RESET, INSTR, READDATA, PC, MEMWRITE, ALUOUT, WRITEDATA);   
        end


    initial begin
        CLK_ENABLE =1'b1;
        RESET = 1'b0;
        INSTR = 16'b0010000010001010;
        READDATA = 16'b0000111100001111;
        #50
        INSTR = 16'b0010000100001111;
        READDATA = 'bx;
        #50
        INSTR = 16'b0000010100010110;
        READDATA = 'bx;
        #50
        INSTR = 16'b1000000010111111;
        READDATA = 'bx;        
        $finish;
    end

    clock dut1(.en(CLK_ENABLE), .clock(CLK));
    cpu uut(.clk(CLK), .reset(RESET), .pc(PC), .instr(INSTR), .memwrite(MEMWRITE), .aluout(ALUOUT), .writedata(WRITEDATA), .readdata(READDATA));
endmodule
`endif // TB_CPU