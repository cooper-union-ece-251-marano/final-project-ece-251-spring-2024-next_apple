//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_regfile
//     Description: Test bench for simple behavorial register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_REGFILE
`define TB_REGFILE

`timescale 1ns/100ps
`include "regfile.sv"
`include "../clock/clock.sv"

module tb_regfile;
    parameter N = 16;
    parameter R = 3;
    logic REGWRITE;
    logic [(R-1):0] READADDR1, READADDR2, WRITEADDR3;
    logic [(N-1):0] WRITEDATA3;
    wire [(N-1):0] READDATA1, READDATA2;
    logic CLK_ENABLE;
    logic CLK;

    initial begin
        $dumpfile("regfile.vcd");
        $dumpvars(0, dut1,uut);
        $monitor("time=%0t \t regwrite = %b \t readAddr1 = %h \t readAddr2= %h\t writeAddr3= %h\t writeData3= %h\t readData1 = %h \t readData2 = %h \t",$realtime, REGWRITE, READADDR1, READADDR2, WRITEADDR3, WRITEDATA3, READDATA1, READDATA2);   
    end

    initial begin
        CLK_ENABLE =1'b1;
        REGWRITE = 0;
        READADDR1 = 0;
        READADDR2 = 0;
        WRITEADDR3 = 0;
        WRITEDATA3 = 0;


        #50 

        // test 1
        // write data to reg 5
        REGWRITE = 1;
        WRITEADDR3 = 3'b101;
        WRITEDATA3 = 16'hf132;
        #10
        // read from reg 5
        REGWRITE = 0;
        READADDR1 = 3'b101;
        #10

        if (READDATA1 != 16'hf132) $display("test failed");
        
        else $display("test passed");

        // test 2
        // write data to reg 7
        REGWRITE = 1;
        WRITEADDR3 = 3'b111;
        WRITEDATA3 = 16'hff42;
        #10
        // read from reg 5
        REGWRITE = 0;
        READADDR1 = 3'b111;
        #10

        if (READDATA1 != 16'hff42) $display("test failed");
        
        else $display("test passed");

        $finish;
    end

    clock dut1(.en(CLK_ENABLE), .clock(CLK));
    regfile uut(.clock(CLK), .regWrite(REGWRITE), .readAddr1(READADDR1), .readAddr2(READADDR2), .writeAddr3(WRITEADDR3), .writeData3(WRITEDATA3), .readData1(READDATA1), .readData2(READDATA2));

endmodule
`endif // TB_REGFILE