`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 12:38:12
// Design Name: 
// Module Name: top
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


module top (
    input  wire        clk,
    input  wire        rst_ext,
    input  wire        enable_ext,
    input  wire [3:0]  d_ext,
    output wire [3:0]  q
);

    reg        rst_r;
    reg        enable_r;
    reg [3:0]  d_r;

    always @(posedge clk) begin
        rst_r    <= rst_ext;
        enable_r <= enable_ext;
        d_r      <= d_ext;
    end

    four_bit_register u_reg (
        .clk(clk),
        .rst(rst_r),
        .enable(enable_r),
        .d(d_r),
        .q(q)
    );

endmodule
