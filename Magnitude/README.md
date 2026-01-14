# 4-bit magnitude
## Design

<details open>
<summary>magnitude.v</summary>

```verilog
module magnitude(
    input wire [3:0] a,b,
    output reg a_greater_b,
    output reg a_lesser_b,
    output reg a_equal_b
    );

    always @ (*) begin
        a_greater_b=1'b0;
        a_lesser_b=1'b0;
        a_equal_b=1'b0;
        if(a<b)
        a_lesser_b=1'b1;
        else if (a>b)
        a_greater_b=1'b1;
        else if (a==b)
        a_equal_b=1'b1;
    end

endmodule
```

</details>

<details open>
<summary>magnitude.v</summary>

```verilog
module top(
input wire [7:0] sw,
output wire [2:0] led
    );
    
    magnitude dut(
    .a(sw[3:0]),
    .b(sw[7:4]),
    .a_greater_b(led[0]),
    .a_lesser_b(led[1]),
    .a_equal_b(led[2])
    
    );
endmodule
```

</details>

## Testbench
<details open>
<summary>tb_magnitude.v</summary>

```verilog
module tb_magnitude();
reg [3:0] a,b;
wire a_greater_b;
wire a_lesser_b;
wire a_equal_b;
integer i,j;
magnitude dut (a,b,a_greater_b,a_lesser_b,a_equal_b);

initial begin
for(i=0;i<16;i=i+1) begin
for(j=0;j<16;j=j+1) begin
a=i[3:0];
b=j[3:0];
#10;


$display("%0b %0b %0b %0b %0b",a,b,a_greater_b,a_lesser_b,a_equal_b);
end
end
$finish;
end

endmodule
```
</details>

## Constraints

<details open>
<summary>magnitude.xdc</summary>

```tcl
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports {sw[1]}]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]
set_property -dict { PACKAGE_PIN W17 IOSTANDARD LVCMOS33 } [get_ports {sw[3]}]
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 } [get_ports {sw[4]}]
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports {sw[5]}]
set_property -dict { PACKAGE_PIN W14 IOSTANDARD LVCMOS33 } [get_ports {sw[6]}]
set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports {sw[7]}]


set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports {led[0]}]
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports {led[1]}]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports {led[2]}]

```

</details>