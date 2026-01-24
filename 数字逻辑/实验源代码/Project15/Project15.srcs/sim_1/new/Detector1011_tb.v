`timescale 1ns / 1ps

module Detector1101_tb(

    );
    reg clk,rst,din;
    wire dout;
    reg [3:0]count = 0;
    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end
    Detector1101 D(.clk(clk),.rst(rst),.din(din),.dout(dout));
    initial begin
        rst = 1;
        #10 rst = 0;
    end
    always @(posedge clk) begin
        count <= count + 1;
    end

    always @(*) begin
        case (count)
            4'd0:din = 1;
            4'd1:din = 1;
            4'd2:din = 0;
            4'd3:din = 1;
            default: din = 0;
        endcase
    end
endmodule
