# Encoder 4:2
## Design

<details open>
<summary>encoder.v</summary>

```verilog
module encoder(
input wire [3:0] in,
output reg valid,
output reg [1:0] y
);
integer i;

always @(*) begin
valid=1'b0;
y=2'b00;
for(i=0;i<4;i=i+1) begin
if(in[i])begin
y=i;
valid=1'b1;
end
end
end
endmodule
```

</details>

## Testbench
<details open>
<summary>tb_encoder.v</summary>

```verilog
module tb_encoder();
reg [3:0] in;
wire valid;
wire [1:0] y;
encoder dut(in,valid,y);
integer k;
initial begin
for(k=0;k<16;k=k+1) begin
in=k;
#10;
$display("%0t in = %0b valid = %0b y = %0b ", $time,in,valid,y);
end
#20;
$finish;
end
endmodule
```
</details>

## Constraints

<details open>
<summary>encoder.xdc</summary>

```xdc
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports {in[0]}]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports {in[1]}]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports {in[2]}]
set_property -dict { PACKAGE_PIN W17 IOSTANDARD LVCMOS33 } [get_ports {in[3]}]

set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports valid]
set_property -dict { PACKAGE_PIN U15 IOSTANDARD LVCMOS33 } [get_ports {y[0]}]
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports {y[1]}]
```

</details>