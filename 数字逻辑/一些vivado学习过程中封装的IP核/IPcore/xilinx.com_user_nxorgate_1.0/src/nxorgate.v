`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/16 20:37:50
// Design Name: 
// Module Name: nxorgate
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


module nxorgate
#(parameter WIDTH=8)
    (
        input [(WIDTH-1):0] a,
        input [(WIDTH-1):0] b,
        output [(WIDTH-1):0] c
    );
    
    assign c = a ~^ b;
endmodule
