# 1-Bit ALU
## Design

<details open>
<summary>alu.v</summary>

```verilog
module alu(a,b,cin,sel,y,cout);
input  wire a,b,cin;
input  wire [2:0] sel;
output reg  y,cout;

always @(*) begin
    y    = 1'b0;
    cout = 1'b0;

    case (sel)
        3'b000: begin
            {cout, y} = a + b + cin;        // ADD
        end
        3'b001: begin
            {cout, y} = a + (~b) + cin;     // SUB (cin must be 1)
        end
        3'b010: begin
            y = a & b;                      // MUL (1-bit)
        end
        3'b011: begin
            y = ~a;                         // NOT
        end
        3'b100: begin
            y = a & b;                      // AND
        end
        3'b101: begin
            y = a | b;                      // OR
        end
        3'b110: begin
            y = a ^ b;                      // XOR
        end
        3'b111: begin
            y = ~(a ^ b);                   // XNOR
        end
        default: begin
            y    = 1'b0;
            cout = 1'b0;
        end
    endcase
end

endmodule
```

</details>

## Testbench
<details open>
<summary>tb_alu.v</summary>

```verilog
module tb_alu;
reg a,b,cin;
reg [2:0] sel;
wire y,cout;

alu dut (a,b,cin,sel,y,cout);

initial begin
    a=1; b=0; cin=1; sel=3'b000; #5; // ADD
    a=1; b=1; cin=1; sel=3'b001; #5; // SUB
    a=1; b=1; cin=0; sel=3'b010; #5; // MUL
    a=1; b=1; cin=0; sel=3'b011; #5; // NOT
    a=1; b=1; cin=0; sel=3'b100; #5; // AND
    a=1; b=1; cin=0; sel=3'b101; #5; // OR
    a=1; b=1; cin=0; sel=3'b110; #5; // XOR
    a=1; b=1; cin=0; sel=3'b111; #5; // XNOR
    $finish;
end

endmodule
```
</details>

## Constraints

<details open>
<summary>alu.xdc</summary>

```tcl

set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sel[0]}]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {sel[1]}]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {sel[2]}]
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports a]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports b]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports cin]

## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports y]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports cout]
```

</details>