# d-flip-flop
## Design

<details open>
<summary>d_flip_flop.v</summary>

```verilog
module d_flip_flop(
input wire clk,rst,enable,d,
output reg q
    );
    
    always @ (posedge clk) begin
    if(rst)
    q<=1'b0;
    else if (enable)
    q<=d;
    end
endmodule
```
</details>

<details open>
<summary>top.v</summary>

```verilog
module top (
    input  wire clk,
    input  wire rst_ext,      
    input  wire enable_ext,   
    input  wire d_ext,      
    output wire q
);

    reg rst_r;
    reg enable_r;
    reg d_r;

    always @(posedge clk) begin
        rst_r    <= rst_ext;
        enable_r <= enable_ext;
        d_r      <= d_ext;
    end
    
    d_flip_flop u_dff (
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
    reg d_ext;
    wire q;
    
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
```
</details>

## Constraints

<details open>
<summary>d_flip_flop.xdc</summary>

```tcl
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name sys_clk -period 10.000 [get_ports clk]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports rst_ext]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports enable_ext]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports d_ext]


set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports q]
```

</details>