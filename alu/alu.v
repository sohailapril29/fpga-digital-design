`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 15:30:55
// Design Name: 
// Module Name: alu
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


module alu(a,b,cin,sel,y,cout);
input  wire a,b,cin;
input  wire [2:0] sel;
output reg  y,cout;

always @(*) begin
    y    = 1'b0;
    cout = 1'b0;

    case (sel)
        3'b000: begin
            {cout, y} = a + b + cin;        // ADD
        end
        3'b001: begin
            {cout, y} = a + (~b) + cin;     // SUB (cin must be 1)
        end
        3'b010: begin
            y = a & b;                      // MUL (1-bit)
        end
        3'b011: begin
            y = ~a;                         // NOT
        end
        3'b100: begin
            y = a & b;                      // AND
        end
        3'b101: begin
            y = a | b;                      // OR
        end
        3'b110: begin
            y = a ^ b;                      // XOR
        end
        3'b111: begin
            y = ~(a ^ b);                   // XNOR
        end
        default: begin
            y    = 1'b0;
            cout = 1'b0;
        end
    endcase
end

endmodule

