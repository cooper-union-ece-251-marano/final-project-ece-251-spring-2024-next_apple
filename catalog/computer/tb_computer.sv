//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_computer
//     Description: Test bench for a single-cycle MIPS computer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_COMPUTER
`define TB_COMPUTER

`timescale 1ns/100ps

`include "computer.sv"
`include "../clock/clock.sv"

module tb_computer;
  parameter n = 16; // # bits to represent the instruction / ALU operand / general purpose register (GPR)
  parameter m = 3;  // # bits to represent the address of the 2**m=32 GPRs in the CPU
  logic clk;
  logic clk_enable;
  logic reset;
  logic memwrite;
  logic [15:0] writedata;
  logic [15:0] dataadr;

  logic firstTest, secondTest;

  // instantiate the CPU as the device to be tested
  computer dut(clk, reset, writedata, dataadr, memwrite);
  clock dut1(.en(clk_enable), .clock(clk));


  initial begin
    firstTest = 1'b0;
    secondTest = 1'b0;
   
    $dumpfile("tb_computer.vcd");
    $dumpvars(0,dut1,dut,clk,reset,writedata,dataadr,memwrite);
    $monitor("t=%t\t0x%7h\t%7d\t%8d",$realtime,writedata,dataadr,memwrite);
    // $dumpvars(0,clk,a,b,ctrl,result,zero,negative,carryOut,overflow);
    // $display("Ctl Z  N  O  C  A                    B                    ALUresult");
    // $monitor("%3b %b  %b  %b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)",ctrl,zero,negative,overflow,carryOut,a,a,a,b,b,b,result,result,result);
  end

  // initialize test
  initial begin
    #0 clk_enable <= 0; #50 reset <= 1; # 50; #50 clk_enable <= 1;
    #10 
    #10 reset<=0;
    #300
    $finish;
  end
// always @(posedge clk) begin
//   $display("PC: %h, PCnext: %h, PCplus4: %h, PCbranch: %h, SignImm: %h, SignImmSh: %h, Instr: %h", pc, pcnext, pcplus4, pcbranch, signimm, signimmsh, instr);
// end
  // monitor what happens at posedge of clock transition
  always @(posedge clk)
  begin
      $display("+");
      $display("\treset = %b", reset);
      $display("\pc = %b", dut.pc);
      $display("\t+instr = 0x%h",dut.instr);
      $display("\t+op = 0b%b",dut.mips.c.op);
      $display("\t+controls = 0b%b",dut.mips.c.md.controls);
      $display("\t+funct = 0b%b",dut.mips.c.ad.funct);
      $display("\t+aluop = 0b%b",dut.mips.c.ad.aluop);
      $display("\t+alucontrol = 0b%b",dut.mips.c.ad.alucontrol);
      $display("\t+alu result = 0x%h",dut.mips.dp.alu.out);
      $display("\t+alu srca = 0x%h",dut.mips.dp.alu.srcA);
      $display("\t+alu srcb = 0x%h",dut.mips.dp.alu.srcB);

          $display("\t+memtoreg = 0x%b",dut.mips.dp.resmux.select);
          $display("\t+regfile -- wd3 = %d",dut.mips.dp.resmux.out);

    //  $display("\t+HiLo = 0x%8h",dut.mips.dp.alu.HiLo);
    //   $display("\t+$v0 = 0x%4h",dut.mips.dp.registers.registers[0]);
    //   $display("\t+$v1 = 0x%4h",dut.mips.dp.registers.registers[1]);
    //   $display("\t+$a0 = 0x%4h",dut.mips.dp.registers.registers[2]);
    //  $display("\t+$a1 = 0x%4h",dut.mips.dp.registers.registers[5]);
    //  $display("\t+$t0 = 0x%4h",dut.mips.dp.registers.registers[8]);
    //  $display("\t+$t1 = 0x%4h",dut.mips.dp.registers.registers[9]);
     $display("\t+$rs = 0x%h",dut.mips.dp.registers.readData1);
     $display("\t+$rt = 0x%h",dut.mips.dp.registers.readData2);
     $display("\t+$rd = 0x%h",dut.mips.dp.registers.registers[dut.mips.dp.registers.writeAddr3]);
//      $display("\t+regfile -- ra1 = %d",dut.mips.dp.registers.readAddr1);
//      $display("\t+regfile -- ra2 = %d",dut.mips.dp.registers.readAddr2);
//      $display("\t+regfile -- we3 = %d",dut.mips.dp.registers.regWrite);
//      $display("\t+regfile -- wa3 = %d",dut.mips.dp.registers.writeAddr3);
// $display("\t+regfile -- wd3 = %d",dut.mips.dp.resmux.out);
//      $display("\t+regfile -- rd1 = %d",dut.mips.dp.registers.readData1); 
//      $display("\t+regfile -- rd2 = %d",dut.mips.dp.registers.readData2);
//       $display("\t+RAM[%4d] = %4d",dut.dmem.addr,dut.dmem.readData);
    //   $display("writedata\tdataadr\tmemwrite");
  end

  // run program
  // monitor what happens at negedge of clock transition
  always @(negedge clk) begin


$display("-");
      $display("\treset = %b", reset);
      $display("\pc = %b", dut.pc);
      $display("\t+instr = 0x%h",dut.instr);
      $display("\t+op = 0b%b",dut.mips.c.op);
      $display("\t+controls = 0b%b",dut.mips.c.md.controls);
      $display("\t+funct = 0b%b",dut.mips.c.ad.funct);
      $display("\t+aluop = 0b%b",dut.mips.c.ad.aluop);
      $display("\t+alucontrol = 0b%b",dut.mips.c.ad.alucontrol);
      $display("\t+alu result = 0x%h",dut.mips.dp.alu.out);
      $display("\t+alu srca = 0x%h",dut.mips.dp.alu.srcA);
      $display("\t+alu srcb = 0x%h",dut.mips.dp.alu.srcB);

          $display("\t+memtoreg = 0x%b",dut.mips.dp.resmux.select);
          $display("\t+regfile -- wd3 = %d",dut.mips.dp.resmux.out);
          $display("\t+$rs = 0x%h",dut.mips.dp.registers.readData1);
     $display("\t+$rt = 0x%h",dut.mips.dp.registers.readData2);
     $display("\t+$rd = 0x%h",dut.mips.dp.registers.registers[dut.mips.dp.registers.writeAddr3]);
//      $display("\t+regfile -- ra1 = %d",dut.mips.dp.registers.readAddr1);

  //  $display("\t+$rs = 0x%h",dut.mips.dp.registers.readData1);
  //    $display("\t+$rt = 0x%h",dut.mips.dp.registers.readData2);
  //   //  $display("\t+$rd = 0x%h",dut.mips.dp.registers.registers[dut.mips.dp.registers.writeAddr3]);
  //         $display("\t+regfile -- ra1 = %d",dut.mips.dp.registers.readAddr1);
  //    $display("\t+regfile -- ra2 = %d",dut.mips.dp.registers.readAddr2);
  //    $display("\t+regfile -- we3 = %d",dut.mips.dp.registers.regWrite);
  //    $display("\t+regfile -- wa3 = %d",dut.mips.dp.registers.writeAddr3);
  //    $display("\t+$rd = 0x%h",dut.mips.dp.registers.registers[dut.mips.dp.registers.writeAddr3]);
  //    $display("\t+regfile -- wd3 = %d",dut.mips.dp.resmux.out);
  //    $display("\t+regfile -- rd1 = %d",dut.mips.dp.registers.readData1); 
  //    $display("\t+regfile -- rd2 = %d",dut.mips.dp.registers.readData2);
    //  $display("\t+HiLo = 0x%8h",dut.mips.dp.alu.HiLo);
    // $display("\t+$rs = 0x%h",dut.mips.dp.registers.readData1);
    // $display("\t+$rt = 0x%h",dut.mips.dp.registers.readData2);
    // $display("\t+$rd = 0x%h",dut.mips.dp.registers.writeData3);
//    $display("\t+$a1 = 0x%4h",dut.mips.dp.rf.rf[5]);
  //    $display("\t+$t0 = 0x%4h",dut.mips.dp.rf.rf[8]);
  //    $display("\t+$t1 = 0x%4h",dut.mips.dp.rf.rf[9]);
  //    $display("\t+regfile -- ra1 = %d",dut.mips.dp.rf.readAddr1);
  //    $display("\t+regfile -- ra2 = %d",dut.mips.dp.rf.readAddr2);
 //     $display("\t+regfile -- we3 = %d",dut.mips.dp.rf.we3);
 //     $display("\t+regfile -- wa3 = %d",dut.mips.dp.rf.writeAddr3);
 //     $display("\t+regfile -- wd3 = %d",dut.mips.dp.rf.writeData3);
 //     $display("\t+regfile -- rd1 = %d",dut.mips.dp.rf.readData1); !!this
 //     should work but doesnt... same w readData2
 //     $display("\t+regfile -- rd2 = %d",dut.mips.dp.rf.readData2);
    $display("\t+RAM[%4d] = %d",dut.dmem.addr,dut.dmem.readData);
    $display("writedata\tdataadr\tmemwrite");

  end

  // always @(negedge clk, posedge clk) begin
  //   // check results
  //   // TODO: You need to update the checks below
  //    if (dut.dmem.RAM[63] == 16'd5)
  //      begin
  //        $display("Successfully wrote 0x%4h at RAM[%3]",16'd5,);
  //        firstTest = 1'b1;
  //      end

  //   else $display("fail");
/*
    if (dut.dmem.RAM[84] === 16'h96)
      begin
        $display("Successfully wrote 0x%4h at RAM[%3d]",84,32'h0096);
        firstTest = 1'b1;
      end
    if(memwrite) begin
      if(dataadr === 84 /*& writedata === 16'h96)

      begin
        $display("Successfully wrote 0x%4h at RAM[%3d]",writedata,dataadr);
        firstTest = 1'b1;
      end
    end
    
    if (firstTest === 1'b1)
    begin
        $display("Program successfully completed");
        $finish;
    end*/
  

endmodule

`endif // TB_COMPUTER
