`timescale 1ns / 1ps

module Syn_SinglePortRAM_tb(

    );
    //parameter
    parameter DATA_WIDTH = 4;
    parameter ADDR_DEPTH = 4;
    //inputs
    reg clk,rst;
    reg [ADDR_DEPTH-1:0]addr;
    reg [DATA_WIDTH-1:0]data_in;
    reg we;
    //output
    wire[DATA_WIDTH-1:0]data_out;
    //init
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    Syn_SinglePortRAM u(
        .clk(clk),
        .rst(rst),
        .addr(addr[ADDR_DEPTH-1:0]),
        .data_in(data_in[DATA_WIDTH-1:0]),
        .we(we),
        .data_out(data_out[DATA_WIDTH-1:0])
    );
    initial begin
        #10 rst = 1;//reset
        #10 rst = 0;
        //write test
        #5 we = 1;
        #10 addr=4'b0000;data_in=$random;
        #10 addr=4'b0001;data_in=$random;
        #10 addr=4'b0010;data_in=$random;
        #10 addr=4'b0011;data_in=$random;
        #10 addr=4'b0100;data_in=$random;
        #10 addr=4'b0101;data_in=$random;
        #10 addr=4'b0110;data_in=$random;
        #10 addr=4'b0111;data_in=$random;
        #10 addr=4'b1000;data_in=$random;
        #10 addr=4'b1001;data_in=$random;
        #10 addr=4'b1010;data_in=$random;
        #10 addr=4'b1011;data_in=$random;
        #10 addr=4'b1100;data_in=$random;
        #10 addr=4'b1101;data_in=$random;
        #10 addr=4'b1110;data_in=$random;
        #10 addr=4'b1111;data_in=$random;
        //syn_read test
        #10 we = 0;
        #10 @(negedge clk) addr=4'b0000;
        #10 @(negedge clk) addr=4'b0001;
        #10 @(negedge clk) addr=4'b0010;
        #10 @(negedge clk) addr=4'b0011;
        #10 @(negedge clk) addr=4'b0100;
        #10 @(negedge clk) addr=4'b0101;
        #10 @(negedge clk) addr=4'b0110;
        #10 @(negedge clk) addr=4'b0111;
        #10 @(negedge clk) addr=4'b1000;
        #10 @(negedge clk) addr=4'b1001;
        #10 @(negedge clk) addr=4'b1010;
        #10 @(negedge clk) addr=4'b1011;
        #10 @(negedge clk) addr=4'b1100;
        #10 @(negedge clk) addr=4'b1101;
        #10 @(negedge clk) addr=4'b1110;
        #10 @(negedge clk) addr=4'b1111;
    end
endmodule
