`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/01 22:18:46
// Design Name: 
// Module Name: divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divider(
    input clk,rst,
    input [15:0] target,
    output reg clk_div
    );
    reg [15:0] counter;
    always @(posedge clk) begin
        if(rst)
        begin
            counter <= 0;
            clk_div <= 0;
        end
        else if(counter==target)
        begin
            counter <= 0;
            clk_div <= ~clk_div;
        end
        else 
            counter <= counter+1;
    end
endmodule
