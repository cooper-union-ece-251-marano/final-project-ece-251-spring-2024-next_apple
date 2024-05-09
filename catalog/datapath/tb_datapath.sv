//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala, Dylan Meyer O'Connor
// 
//     Create Date: 2023-02-07
//     Module Name: tb_datapath
//     Description: Test bench for datapath
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_DATAPATH
`define TB_DATAPATH

`timescale 1ns/100ps
`include "datapath.sv"
`include "../clock/clock.sv"

module tb_datapath;
    parameter N = 16;
    logic CLK;
    logic RESET, MEMTOREG, PCSRC;
    // logic PC_ENABLE;
    logic ALUSRC, REGDST, REGWRITE, JUMP;
    logic [2:0] ALUCONTROL;
    wire ZERO;
    logic [N-1:0] PC;
    logic [N-1:0] INSTR;
    wire [N-1:0] ALUOUT, WRITEDATA;
    logic [N-1:0] READDATA;
    logic clk_enable;

    clock dut1(.en(clk_enable), .clock(CLK));

    initial begin
    	$dumpfile("datapath.vcd");
	    $dumpvars(0, uut, dut1);
      
//	$monitor("",);
        $monitor("|clk-%b|time=%0t, alu control = %b, alu out = %h,\ninstr= %h\t pc= %h\nread data= %b \n",CLK,$realtime,ALUCONTROL, 
        ALUOUT,INSTR,PC,READDATA);
//	$monitor("")
    end

    
  

    initial begin
        #0 clk_enable <=0;
   //     CLK <= 0;
        RESET <= 1;
        REGDST <= 0;
        REGWRITE <= 0;
        MEMTOREG <= 0;
        JUMP <= 0;
        ALUSRC <= 0;
        ALUCONTROL <= 0;
        INSTR <= 0;
        READDATA <= 0;
        clk_enable <= 1;
        PCSRC <= 0;
        #100 $finish;
    end
   // always #5 CLK <= ~CLK;

    initial begin
 //   #10 CLK <= 1;
 #10 RESET <= 0;
    #10 REGDST <= 1;
    #10 REGWRITE <= 1;
    #10 MEMTOREG <= 0;
    #10 JUMP <= 1;
    #10 ALUSRC <= 0;
    #10 PCSRC <= 0;
    #10 ALUCONTROL <= 4'b0000; // Provide ALU control signal for your instruction
    #10 INSTR <= 16'h208a; // Provide instruction
    #10 READDATA <= 16'h0001;
    #10
    #10
    #10
    #10
    #1000
    #1000
    
    // #10 WRITEDATA <= 16'h00ba;
    $finish;
    end

    // Add more test cases as needed
  
    datapath uut (
    .clk(CLK),
    .reset(RESET),
    // .pc_enable(PC_ENABLE),
    .memtoreg(MEMTOREG),
    .pcsrc(PCSRC),
    .alusrc(ALUSRC),
    .regdst(REGDST),
    .regwrite(REGWRITE),
    .jump(JUMP),
    .alucontrol(ALUCONTROL),
    .zero(ZERO),
    .pc(PC),
    .instr(INSTR),
    .aluout(ALUOUT),
    .writedata(WRITEDATA),
    .readdata(READDATA)
  );
  
endmodule
`endif // TB_DATAPATH