//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineers: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 2023-02-07
//     Module Name: tb_dff
//     Description: Test bench for 32 bit D flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_DFF
`define TB_DFF

`timescale 1ns/100ps
`include "dff.sv"
`include "../clock/clock.sv"

module tb_dff;
    parameter n = 16; // #bits for an operand
    wire CLK;
    logic EN;
    logic CLK_EN;
    logic RESET;
    logic SET;
    logic [(n-1):0] D;
    logic [(n-1):0] Q;
    logic [(n-1):0] Q_n;

   initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0, uut0, uut1);
        //$monitor("d = %b (0x%0h)(%0d) q = %b (0x%0h)(%0d) ", d,d,d,q,q,q);
        $monitor("time=%0t \t r=%h d=%h q=%h",$realtime, RESET, D, Q);
    end

    initial begin
	CLK_EN <= 1;
        D <= #n'h0000;
        EN <= 0;
	#10 D <= #n'h8000;
        #10 EN <= 1;
        #10 RESET <= 1;
        #20 D <= #n'h0001;
        #10 RESET <= 0;
        #10 RESET <=0;
	#10 SET <= 1;

    //    #20 D <= #n'h8000;
   //     #100 EN <= 0;
        $finish;        
    end

    dff uut0(
        .clk(CLK), .set(SET), .reset(RESET), .enable(EN), .d(D), .q(Q), .q_n(Q_n)
    );

   clock uut1(
        .ENABLE(CLK_EN),
        .CLOCK(CLK)
    );
endmodule
`endif // TB_DFF
