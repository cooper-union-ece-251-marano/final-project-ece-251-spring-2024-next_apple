//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_mux2
//     Description: Test bench for 2 to 1 multiplexer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_MUX2
`define TB_MUX2

`timescale 1ns/100ps
`include "mux2.sv"
`include "../clock/clock.sv"

module tb_mux2;
    parameter n = 16; 
    logic SEL;
    logic [(n-1):0] A, B;
    logic [(n-1):0] Y;
    wire CLK;
    logic ENABLE;


   initial begin
        $dumpfile("mux2.vcd");
        $dumpvars(0, uut0, uut1);
        // $monitor("s = %0b d0 = (0x%0h)(%0d) d1 = (0x%0h)(%0d) y = (0x%0h)(%0d)", s, d0, d0, d1, d1, y, y);
        $monitor("time=%0t \t enable=%0b s=%0b y=%h d0=%h d1=%h",$realtime, ENABLE, SEL, Y, A, B);
    end

    initial begin
        A <= #n'h8000;
        B <= #n'h0001;
        ENABLE <= 0;
        #10 ENABLE <= 1;
        #10 SEL <= 1'b0;
        #20 SEL <= 1'b1;
        #100 ENABLE <= 0;
	#100 SEL <= 1'b0;
        $finish;
    end

    mux2 uut0(
        .select(SEL), .a(A), .b(B), .out(Y)
    );

    clock uut1(
        .en(ENABLE),
        .clock(CLOCK)
    );
endmodule
`endif // TB_MUX2
