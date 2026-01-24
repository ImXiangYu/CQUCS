`timescale 1ns / 1ps

module clock_div(clk, reset, clk_div);
    input clk, reset;
    output reg clk_div;

    parameter N = 5;
    parameter T_1s = 9999_9999;
    integer count = 0;
    
    always @(posedge clk or negedge reset) begin
        if(!reset)
            count <= 0;
        else begin
            clk_div <= 0;
            if(count < (T_1s/N))
                count = count + 1;
            else begin
                count <= 0;
                clk_div <= 1;
            end
        end
    end
endmodule
