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