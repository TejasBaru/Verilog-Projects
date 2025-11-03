`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:14 11/01/2025 
// Design Name: 
// Module Name:    modecount 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Mode counter is a configurable counter tha can be a Up counter, Down COunter, Johnson Counter and Ring counter.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module modecount #(parameter N = 4) (   // Parameterized version
    input clk,
    input rst,
    input en,
    input [1:0] mode,
    output reg [N-1:0] count
);

    always @(posedge clk) begin
        if (rst)
            count <= {N{1'b0}};   // Reset to all zeros
        else if (en) begin
            case (mode)
                2'b00: count <= count + 1'b1;                   // Up counter
                2'b01: count <= count - 1'b1;                   // Down counter
                2'b10: count <= {count[N-2:0], count[N-1]};     // Rotate left
                2'b11: count <= {count[0], count[N-1:1]};       // Rotate right
                default: count <= count;
            endcase
        end
    end
endmodule

