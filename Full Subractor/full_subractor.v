`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 11:46:18
// Design Name: 
// Module Name: full_subractor
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


module full_subractor(
input wire a ,b ,c,
output wire d,b0
    );
    
assign d = a ^ b ^c;
assign b0 = ~a&(b|c) | (b&c);    
    
endmodule
