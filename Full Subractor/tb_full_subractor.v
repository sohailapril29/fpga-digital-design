`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 11:49:30
// Design Name: 
// Module Name: tb_full_subractor
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


module tb_full_subractor;

reg a,b,c;
wire d,b0;
integer i;
full_subractor dut(a,b,c,d,b0);
initial begin
for(i=0;i<8;i=i+1) begin
{a,b,c} = i;
#5;
$display("%0b %0b %0b %0b %0b", a,b,c,d,b0);
end
#10;
$finish;
end
endmodule
