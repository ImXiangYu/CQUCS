`timescale 1ns / 1ps

module PISO_tb(

    );
    reg clk,rst,in;
    wire dout;
    reg[7:0]din;
    initial begin
        clk = 0;
        forever #5 clk=~clk;
    end
    PISO P(.clk(clk),.rst(rst),.in(in),.din(din),.dout(dout));
    initial begin
        #10 rst = 1;
        #10 rst = 0;in = 1;din = 8'b10110110;
        #10 in = 0;
        #100 rst = 0;in = 1;din = 8'b11111111;
        #10 in = 0;
    end
endmodule
