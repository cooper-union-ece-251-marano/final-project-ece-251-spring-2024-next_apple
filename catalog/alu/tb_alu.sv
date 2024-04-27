//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_alu
//     Description: Test bench for simple behavorial ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALU
`define TB_ALU

`timescale 1ns/100ps
`include "alu.sv"

module tb_alu;
    parameter N = 16;
    reg [N-1:0] SRCA, SRCB;
    reg [2:0] ALUCONTROL;
    logic [N-1:0] OUT;


    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, uut);
        $monitor("srcA = %b, srcB = %b, alucontrol = %b, out = %b", SRCA, SRCB, ALUCONTROL, OUT);
       
    end

    initial
    begin: apply_stimulus
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b000;
      #10
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b001;
      #10
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b010;
      #10
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b0000000000000010;
      ALUCONTROL <= 3'b011;
      #100
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b100;
      #100
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b101;
      #100
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b110;
      #10
      SRCA <= #N'b1000000000010010;
      SRCB <= #N'b1010011100010010;
      ALUCONTROL <= 3'b111;
      
   end

   alu #(.n(N)) uut(
        .srcA(SRCA), .srcB(SRCB), .alucontrol(ALUCONTROL), .out(OUT)
   );

endmodule
`endif // TB_ALU