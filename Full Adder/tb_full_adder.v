`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 10:52:37
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder;

reg a,b,cin;
wire sum,cout;
integer i;

full_adder dut (a,b,cin,sum,cout);

initial begin
$display("a b cin sum cout");
for(i=0;i<8;i=i+1)begin
{a,b,cin} = i;
#5;
$display("%0t %0b %0b %0b %0b %0b ", $time,a,b,cin,sum,cout);
end
#10;
$finish;
end
endmodule

