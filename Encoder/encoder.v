`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 22:09:34
// Design Name: 
// Module Name: encoder
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


module encoder(
input wire [3:0] in,
output reg valid,
output reg [1:0] y
);
integer i;

always @(*) begin
valid=1'b0;
y=2'b00;
for(i=0;i<4;i=i+1) begin
if(in[i])begin
y=i;
valid=1'b1;
end
end
end
endmodule
