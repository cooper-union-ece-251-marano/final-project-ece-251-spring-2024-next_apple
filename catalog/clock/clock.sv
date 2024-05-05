//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Lamiya Rangwala, Dylan Meyer O'Connor
// 
//     Create Date: 2023-02-07
//     Module Name: clock
//     Description: Clock generator; duty cycle = 50%
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef CLOCK
`define CLOCK

`timescale 1ns/100ps

module clock
    #(parameter period = 10)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input en,
    output reg clock
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    reg start_clock;
    localparam half_period = period/2;

    // initialize variables
    initial begin
      clock <= 0;
      start_clock <= 0;
    end

    always @(posedge en or negedge en) begin
        if (en) begin
            start_clock = 1;
        end
        else begin
            start_clock = 0;
        end
      
    end
    always @(start_clock) begin
        clock = 0;
        while (start_clock) begin
            #(period) clock = ~clock;
        end
        clock = 0;
    end
endmodule

`endif // CLOCK
