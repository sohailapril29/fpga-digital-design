# Decoder 2:4
## Design

<details open>
<summary>decoder.v</summary>

```verilog
module decoder(
input wire [1:0] in,
input wire valid,
output reg [3:0] y
    );
    always @ (*) begin 
    y=4'b0000;
    if(valid) begin
    case(in)
        2'b00: y = 4'b0001;
        2'b01: y = 4'b0010;
        2'b10: y = 4'b0100;
        2'b11: y = 4'b1000;
        default: y = 4'b0000;
        endcase
    end
    end
endmodule


```

</details>

## Testbench
<details open>
<summary>tb_decoder.v</summary>

```verilog
module tb_decoder();

reg [1:0] in;
reg valid;
wire [3:0] y;
integer j;
decoder dut (in,valid,y);
initial begin
valid = 0; in=2'b00; #10;
$display("%0t %0b %0b %0b",$time,in,valid,y);
valid=1;
for(j=0;j<4;j=j+1) begin
in=j;
#10;
$display("%0t %0b %0b %0b",$time,in,valid,y);
end
$finish;
end
endmodule
```
</details>

## Constraints

<details open>
<summary>decoder.xdc</summary>

```tcl
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports {in[0]}]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports {in[1]}]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports valid]


set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports {y[0]}]
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports {y[1]}]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports {y[2]}]
set_property -dict { PACKAGE_PIN V19 IOSTANDARD LVCMOS33 } [get_ports {y[3]}]
```

</details>