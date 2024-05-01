//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 4/30/2024
//     Module Name: tb_aludec
//     Description: Test bench for simple behavorial ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALUDEC
`define TB_ALUDEC

`timescale 1ns/100ps
`include "aludec.sv"

module tb_aludec;
    parameter n = 16;
	
    logic [2:0] Funct, AluCon;
    logic [1:0] AluOp;


    initial begin
    	$dumpfile("aludec.vcd");
	$dumpvars(0, uut);
        //$monitor("enable = %b clk = %b", enable, clk);
        $monitor("time=%0t \t aluop=%b funct=%b alucontrol=%h ",$realtime,AluOp,Funct,AluCon);
	
    end

    initial begin 
	#10 AluOp <= 2'b00;
	#10 Funct <= 3'b000;
	#10 Funct <= 3'b111;
	#10 AluOp <= 2'b01; 
	#10 Funct <= 3'b000;
	#10 AluOp <= 2'b11;
	#10 Funct <= 001;
	#10 Funct <= 010;
	#10 Funct <= 011;
	#10 Funct <= 100;

	
	
    end 
	



    aludec uut(
	.aluop(AluOp), .funct(Funct), .alucontrol(AluCon)
    );
endmodule
`endif // TB_ALUDEC
