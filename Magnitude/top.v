`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 10:56:09
// Design Name: 
// Module Name: top
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


module top(
input wire [7:0] sw,
output wire [2:0] led
    );
    
    magnitude dut(
    .a(sw[3:0]),
    .b(sw[7:4]),
    .a_greater_b(led[0]),
    .a_lesser_b(led[1]),
    .a_equal_b(led[2])
    
    );
endmodule
