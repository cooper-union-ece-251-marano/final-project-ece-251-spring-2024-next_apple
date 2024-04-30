//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_sl2
//     Description: Test bench for shift left by 2 (multiply by 4)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_SL2
`define TB_SL2

`timescale 1ns/100ps
`include "sl2.sv"

module tb_sl2;
    parameter N = 16;
    logic [(N-1):0] NUMBER, NUMBER4;

   initial begin
        $dumpfile("sl2.vcd");
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
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abciN = %b, cout = %b, sum = %b", {a, b, ciN}, cout, sum);
         {NUMBER} = invect;
         #10 $display("NUMBER=%b NUMBER4=%b",
            NUMBER, NUMBER4);
      end
      $finish;
   end

    sl2 #(.n(N)) uut(
        .number(NUMBER), .number4(NUMBER4)
    );
endmodule
`endif // TB_SL2