`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 21:23:50
// Design Name: 
// Module Name: tb_demux
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


module tb_demux();
reg in,s;
wire d0,d1;
integer i;
demux dut(in,s,d0,d1);

initial begin
for(i=0; i< 4; i= i + 1) begin
{in,s}  = i ;
#5;
$display("%0t in = %0b s = %0b d0 = %0b d1 = %0b",$time,in,s,d0,d1);
end
#10;
$finish;

end

endmodule
