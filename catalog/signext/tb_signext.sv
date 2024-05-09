//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala & Dylan Meyer-O'Connor
// 
//     Create Date: 4/30/2024
//     Module Name: tb_signext
//     Description: Test bench for sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_SIGNEXT
`define TB_SIGNEXT

`timescale 1ns/100ps
`include "signext.sv"

module tb_sl2;
    parameter n = 16; // #bits for an operand
    parameter i = n/2; // #bits for an immediate
    logic [(i-1):0] A;
    logic [(n-1):0] Y;

   initial begin
        $dumpfile("signext.vcd");
        $dumpvars(0, uut);
        //$monitor("a = %b (0x%0h)(%0d) y = %b (0x%0h)(%0d) ", a, a, a, y, y, y);
        $monitor("time=%0t \t a=%b y=%b",$realtime, A, Y);
    end

    initial begin
        #10 A <= #i'h80;
	#10 A <= #i'haa;

    end

    signext uut(
        .a(A), .out(Y)
    );
endmodule
`endif // TB_SIGNEXT
