//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala, Dylan Meyer O'Connor
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER
`define TB_ADDER

`timescale 1ns/100ps
`include "adder.sv"

module tb_adder;
    parameter N = 16;
    reg [(N-1):0] A, B;
    reg CIN; 
    logic [(N-1):0] SUM;
    logic COUT;

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, uut);
       
    end

    initial
    begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         {A} = invect [N-1:0];
         {B} =$random;
         {CIN} = invect[0];
         #10 $display("A=%b, B=%b, CIN=%b, SUM=%b, COUT=%b", A, B, CIN, SUM, COUT);
      end
      $finish;
   end

    adder #(.n(N)) uut(
        .a(A), .b(B), .cin(CIN) , .sum(SUM), .cout(COUT)
    );
endmodule
`endif // TB_ADDER