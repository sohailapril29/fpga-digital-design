`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 12:36:44
// Design Name: 
// Module Name: four_bit_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_register(
    input  wire        clk,
    input  wire        rst,
    input  wire        enable,
    input  wire [3:0]  d,
    output reg  [3:0]  q
);

    always @(posedge clk) begin
        if (rst)
            q <= 4'b0000;
        else if (enable)
            q <= d;
    end

endmodule

