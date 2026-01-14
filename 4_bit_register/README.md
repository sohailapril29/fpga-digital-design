# 4_bit_register
## Design

<details open>
<summary>four_bit_register.v</summary>

```verilog
module four_bit_register(
    input  wire        clk,
    input  wire        rst,
    input  wire        enable,
    input  wire [3:0]  d,
    output reg  [3:0]  q
);

    always @(posedge clk) begin
        if (rst)
            q <= 4'b0000;
        else if (enable)
            q <= d;
    end

endmodule
```

<details open>
<summary>top.v</summary>

```verilog
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
```

</details>

## Testbench
<details open>
<summary>tb_top.v</summary>

```verilog
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
```
</details>

## Constraints

<details open>
<summary>4_bit_register.xdc</summary>

```tcl
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name sys_clk -period 10.000 [get_ports clk]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports rst_ext]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports enable_ext]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports d_ext[0]]
set_property -dict { PACKAGE_PIN W17 IOSTANDARD LVCMOS33 } [get_ports d_ext[1]]
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 } [get_ports d_ext[2]]
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports d_ext[3]]


set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports q[0]]
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports q[1]]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports q[2]]
set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports q[3]]
```

</details>