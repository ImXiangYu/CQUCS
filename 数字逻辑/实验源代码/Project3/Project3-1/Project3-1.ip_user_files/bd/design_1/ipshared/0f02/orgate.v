module orgate
#(parameter WIDTH = 8)
(
    input [(WIDTH-1):0] a,
    input [(WIDTH-1):0] b,
    output [(WIDTH-1):0] c
);

    assign c = a | b;

endmodule
