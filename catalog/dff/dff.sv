//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Dylan Meyer-O'Connor & Lamiya Rangwala
// 
//     Create Date: 2023-04-27
//     Module Name: dff
//     Description: 16 bit D flip flop
////
//////////////////////////////////////////////////////////////////////////////////
`ifndef DFF
`define DFF

`timescale 1ns/100ps

module dff
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic clk, set, reset, enable,
    input  wire [(n-1):0] d,
    output logic [(n-1):0] q //q_n
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @(posedge clk or set or reset) begin
        if (enable) begin
		if (set) begin
			q = ~0;
		//	q_n = ~q;
		end
		else if (reset) begin
			q = 0;
		//	q_n = ~q;

		end
		else begin
			q <= d;
		//	q_n = ~q;
		end
        end
        
	else begin
            q = #n'bz;
	  //  q_n = #n'bz;
        end
end

endmodule

`endif // DFF
