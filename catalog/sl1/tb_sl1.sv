//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala, Dylan Meyer O'Connor
// 
//     Create Date: 2023-02-07
//     Module Name: tb_sl1
//     Description: Test bench for shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_SL1
`define TB_SL1

`timescale 1ns/100ps
`include "sl1.sv"

module tb_sl1;
    parameter N = 16;
    logic [(N-1):0] NUMBER, NUMBER2;

   initial begin
        $dumpfile("sl1.vcd");
        $dumpvars(0, uut);
        //$monitor("a = %0b (0x%0h)(%0d) y = %0b (0x%0h)(%0d) ", a, a, a, y, y, y);
        // $monitor("time=%0t \t a=%b y=%b",$realtime, NUMBER, NUMBER4);
    end

     initial begin : initialize_signals
        NUMBER <= #N'b0;
    
    end

    initial begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         {NUMBER} = invect;
         #10 $display("NUMBER=%b NUMBER2=%b",
            NUMBER, NUMBER2);
      end
      $finish;
   end

    sl1 #(.n(N)) uut(
        .number(NUMBER), .number2(NUMBER2)
    );
endmodule
`endif // TB_SL1