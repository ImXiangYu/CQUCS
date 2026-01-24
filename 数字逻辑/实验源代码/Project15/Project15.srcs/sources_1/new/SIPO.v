`timescale 1ns / 1ps

module SIPO(
    input clk,rst,
    input din,
    output reg [3:0]dout
    );
    always @(posedge clk) begin
        if(rst)
            dout <= 4'b0;
        else
        begin
            dout <= {dout,din};
        end
    end   
endmodule
