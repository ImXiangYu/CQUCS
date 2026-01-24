`timescale 1ns / 1ps

module Syn_SinglePortRAM#(parameter DATA_WIDTH = 4,parameter ADDR_DEPTH = 4)(
    input clk,rst,
    input [ADDR_DEPTH-1:0]addr,
    input [DATA_WIDTH-1:0]data_in,
    input we,
    output reg[DATA_WIDTH-1:0]data_out
    );
    reg [DATA_WIDTH-1:0] RAM[(1<<ADDR_DEPTH)-1:0];

    always @(posedge clk) 
    begin
        if(rst)
        begin:init_RAM
            integer i;//必须声明在有名字的块中，或写在外面
            for(i=0;i<(1<<ADDR_DEPTH);i=i+1)
            begin
                RAM[i] <= 0;
            end
        end
        else if(we)
        // write
        begin
            RAM[addr] <= data_in;
        end
        else if(!we)
        // read
        begin
            data_out <= RAM[addr];
        end
        else
        begin
            data_out <= 0;
        end
    end
endmodule
