# Demux 1:2 
## Design

<details open>
<summary>demux.v</summary>

```verilog
module demux(
input wire in,s,
output wire d0,d1
    );
    
    assign {d0,d1} = s ? {1'b0,in} : {in,1'b0};
endmodule
```

</details>

## Testbench
<details open>
<summary>tb_demux.v</summary>

```verilog
module tb_demux();
reg in,s;
wire d0,d1;
integer i;
demux dut(in,s,d0,d1);

initial begin
for(i=0; i< 4; i= i + 1) begin
{in,s}  = i ;
#5;
$display("%0t in = %0b s = %0b d0 = %0b d1 = %0b",$time,in,s,d0,d1);
end
#10;
$finish;

end

endmodule
```
</details>

## Constraints

<details open>
<summary>demux.xdc</summary>

```xdc
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports s]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports in]


set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports d0]
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports d1]
```

</details>