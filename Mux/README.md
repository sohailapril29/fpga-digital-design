# Mux 2:1 
## Design

<details open>
<summary>mux.v</summary>

```verilog
module mux(
input wire s,d0,d1,
output y
    );
    
assign y = s ? d1 : d0; 
endmodule

endmodule
```

</details>

## Testbench
<details open>
<summary>tb_mux.v</summary>

```verilog
module tb_mux;

reg s,d0,d1;
wire y;
integer i;
mux dut (s,d0,d1,y);

initial begin
for(i=0; i<8; i=i+1) begin
{s,d0,d1} = i;
#5;
$display("%0t %0b %0b %0b %0b", $time,s,d0,d1,y);
end
#10;
$finish;
end
endmodule
```
</details>

## Constraints

<details open>
<summary>mux.xdc</summary>

```tcl
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports s]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports d0]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports d1]

set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports y]
```

</details>