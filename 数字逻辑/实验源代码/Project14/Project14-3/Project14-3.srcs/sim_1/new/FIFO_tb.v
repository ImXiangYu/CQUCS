`timescale 1ns / 1ps

module FIFO_tb(

    );
    //parameter
    parameter DATA_WIDTH = 4;
    parameter ADDR_DEPTH = 4;
    reg clk,rst,wr_en,rd_en;
    reg [DATA_WIDTH-1:0]data_in;
    wire empty,full;
    wire [DATA_WIDTH-1:0] data_out;
    //init
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    FIFO F(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in[DATA_WIDTH-1:0]),
        .empty(empty),
        .full(full),
        .data_out(data_out[DATA_WIDTH-1:0]));
    initial begin
        #10 rst = 1;//reset
        #10 rst = 0;
        //write test
        #10 wr_en = 1;rd_en=0;data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        //read test
        #50 wr_en = 0;rd_en=1;
        //write test
        #10 wr_en = 1;rd_en=0;data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        #10 data_in=$random;
        //read test
        #100 wr_en = 0;rd_en=1;
    end
endmodule
