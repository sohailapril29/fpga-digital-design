`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2026 11:23:10
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder();

reg [1:0] in;
reg valid;
wire [3:0] y;
integer j;
decoder dut (in,valid,y);
initial begin
valid = 0; in=2'b00; #10;
$display("%0t %0b %0b %0b",$time,in,valid,y);
valid=1;
for(j=0;j<4;j=j+1) begin
in=j;
#10;
$display("%0t %0b %0b %0b",$time,in,valid,y);
end
$finish;
end
endmodule
