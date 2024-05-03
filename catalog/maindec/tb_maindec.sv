//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 5/3/2024
//     Module Name: tb_maindec
//     Description: Test bench for simple behavorial main decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_MAINDEC
`define TB_MAINDEC

`timescale 1ns/100ps
`include "maindec.sv"

module tb_maindec;
    parameter n = 16;
    logic [2:0] OP; //3 bit opcode
    logic [1:0] AluOp;
    logic MEM2REG, MEMWRITE, BRANCH, ALUSRC, REGDST, 
    REGWRITE, JUMP; 


    initial begin
    	$dumpfile("maindec.vcd");
	$dumpvars(0, uut);
        //$monitor("enable = %b clk = %b", enable, clk);
        $monitor("time=%0t \t op=%b controls=%b%b%b%b%b%b ",$realtime,OP,REGWRITE,
        REGDST,ALUSRC,BRANCH,MEMWRITE,MEM2REG,JUMP,AluOp);
	
    end

    initial begin 
	OP <= 3'b000;
    #10 OP <= 3'b001;
    #10 OP <= 3'b010;
    #10 OP <= 3'b011;
    #10 OP <= 3'b100;
    #10 OP <= 3'b101;


	
	
    end 

endmodule
`endif // TB_MAINDEC