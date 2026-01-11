# 1-Bit Full Subractor 
## Design

<details open>
<summary>full_subractor.v</summary>

```verilog
module full_subractor(
input wire a ,b ,c,
output wire d,b0
    );
    
assign d = a ^ b ^c;
assign b0 = ~a&(b|c) | (b&c);    
    
endmodule
```

</details>

## Testbench
<details open>
<summary>full_subractor.v</summary>

```verilog

module tb_full_subractor;

reg a,b,c;
wire d,b0;
integer i;
full_subractor dut(a,b,c,d,b0);
initial begin
for(i=0;i<8;i=i+1) begin
{a,b,c} = i;
#5;
$display("%0b %0b %0b %0b %0b", a,b,c,d,b0);
end
#10;
$finish;
end
endmodule
```
</details>

## Constraints

<details open>
<summary>full_subractor.xdc</summary>

```xdc
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports a]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports b]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports c]


set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports d]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports b0]
```

</details>