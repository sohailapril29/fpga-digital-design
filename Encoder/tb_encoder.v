`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 22:22:28
// Design Name: 
// Module Name: tb_encoder
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


module tb_encoder();
reg [3:0] in;
wire valid;
wire [1:0] y;
encoder dut(in,valid,y);
integer k;
initial begin
for(k=0;k<16;k=k+1) begin
in=k;
#10;
$display("%0t in = %0b valid = %0b y = %0b ", $time,in,valid,y);
end
#20;
$finish;
end
endmodule
