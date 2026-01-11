# 1-Bit Full Adder 



## Design

<details open>
<summary>full_adder.v</summary>

```verilog
module full_adder(
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
```

</details>

## Testbench

<details open>
<summary>tb_full_adder.v</summary>

```verilog
module tb_full_adder;

reg a, b, cin;
wire sum, cout;
integer i;

full_adder dut (a, b, cin, sum, cout);

initial begin
    $display("time a b cin | sum cout");
    for (i = 0; i < 8; i = i + 1) begin
        {a, b, cin} = i;
        #5;
        $display("%0t  %0b %0b  %0b  |  %0b   %0b",
                 $time, a, b, cin, sum, cout);
    end
    #10;
    $finish;
end

endmodule
```

</details>

## Constraints

<details open>
<summary>full_adder.xdc</summary>

```xdc
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports a]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports b]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports cin]

set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports sum]
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports cout]
```

</details>
