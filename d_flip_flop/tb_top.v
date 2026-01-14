`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 11:30:13
// Design Name: 
// Module Name: tb_top
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

module tb_top();

    reg clk;
    reg rst_ext;
    reg enable_ext;
    reg d_ext;
    wire q;

    // DUT is now TOP
    top dut (
        .clk(clk),
        .rst_ext(rst_ext),
        .enable_ext(enable_ext),
        .d_ext(d_ext),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_ext = 1; enable_ext = 0; d_ext = 0; #10;
        rst_ext = 0;

        enable_ext = 1; d_ext = 1; #10;
        enable_ext = 1; d_ext = 0; #10;

        enable_ext = 0; d_ext = 1; #10;
        enable_ext = 0; d_ext = 0; #10;

        rst_ext = 1; #10;
        rst_ext = 0; #10;

        $finish;
    end

endmodule
