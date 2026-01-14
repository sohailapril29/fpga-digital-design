`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 12:39:55
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
    reg [3:0] d_ext;
    wire [3:0] q;

    top dut (
        .clk(clk),
        .rst_ext(rst_ext),
        .enable_ext(enable_ext),
        .d_ext(d_ext),
        .q(q)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("TIME  rst en  d     q");
        $display("------------------------");

        rst_ext = 1; enable_ext = 0; d_ext = 4'b0000; #10;
        $display("%4t   %b   %b  %b  %b", $time, rst_ext, enable_ext, d_ext, q);

        rst_ext = 0;
        enable_ext = 1; d_ext = 4'b1010; #10;
        $display("%4t   %b   %b  %b  %b", $time, rst_ext, enable_ext, d_ext, q);

        enable_ext = 1; d_ext = 4'b0101; #10;
        $display("%4t   %b   %b  %b  %b", $time, rst_ext, enable_ext, d_ext, q);

        enable_ext = 0; d_ext = 4'b1111; #10;
        $display("%4t   %b   %b  %b  %b", $time, rst_ext, enable_ext, d_ext, q);

        rst_ext = 1; #10;
        $display("%4t   %b   %b  %b  %b", $time, rst_ext, enable_ext, d_ext, q);

        rst_ext = 0; #10;
        $display("%4t   %b   %b  %b  %b", $time, rst_ext, enable_ext, d_ext, q);

        $finish;
    end

endmodule
