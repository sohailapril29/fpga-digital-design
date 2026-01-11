`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 20:58:43
// Design Name: 
// Module Name: tb_mux
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


module tb_mux;

reg s,d0,d1;
wire y;
integer i;
mux dut (s,d0,d1,y);

initial begin
for(i=0; i<8; i=i+1) begin
{s,d0,d1} = i;
#5;
$display("%0t %0b %0b %0b %0b", $time,s,d0,d1,y);
end
#10;
$finish;
end
endmodule
