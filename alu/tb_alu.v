`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 16:01:41
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;
reg a,b,cin;
reg [2:0] sel;
wire y,cout;

alu dut (a,b,cin,sel,y,cout);

initial begin
    a=1; b=0; cin=1; sel=3'b000; #5; // ADD
    a=1; b=1; cin=1; sel=3'b001; #5; // SUB
    a=1; b=1; cin=0; sel=3'b010; #5; // MUL
    a=1; b=1; cin=0; sel=3'b011; #5; // NOT
    a=1; b=1; cin=0; sel=3'b100; #5; // AND
    a=1; b=1; cin=0; sel=3'b101; #5; // OR
    a=1; b=1; cin=0; sel=3'b110; #5; // XOR
    a=1; b=1; cin=0; sel=3'b111; #5; // XNOR
    $finish;
end

endmodule

