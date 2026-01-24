`timescale 1ns / 1ps

module PISO(
    input clk,rst,in,
    input [7:0]din,
    output reg dout
    );
    reg [7:0] data;
    //data&dout
    always @(posedge clk) begin
        if(rst)
            {dout,data} <= 9'b0;
        else
        begin
            if(in)
            begin
                data<=din;
                dout<=1'b0;
            end
            else
                {dout,data[7:0]} <= {data[7:0],1'b0};
        end
    end
endmodule
