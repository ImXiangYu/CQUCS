`timescale 1ns / 1ps

module divider_tb(

    );
    reg clk;
    reg rst;
    reg[15:0]target;
    wire clk_div;
    initial begin
        clk = 0;
        target = 200;
        forever #5 clk = ~clk;
    end
    divider d(.clk(clk),.clk_div(clk_div),.target(target),.rst(rst));
    initial begin
        #10 rst = 1;
        #10 rst = 0;
    end
endmodule
