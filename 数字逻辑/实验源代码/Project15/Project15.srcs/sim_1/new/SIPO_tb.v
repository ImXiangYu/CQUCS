`timescale 1ns / 1ps

module SIPO_tb(

    );
    reg clk,rst,in,din;
    wire [3:0]dout;
    initial begin
        clk = 0;
        forever #5 clk=~clk;
    end
    SIPO S(.clk(clk),.rst(rst),.din(din),.dout(dout));
    initial begin
        #10 rst = 1;
        repeat(50)
        begin
            #10 rst = 0;in = 1;din = $random;
        end
    end
endmodule
