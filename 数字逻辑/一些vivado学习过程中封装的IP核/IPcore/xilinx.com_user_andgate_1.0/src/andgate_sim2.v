`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/16 19:39:58
// Design Name: 
// Module Name: andgate_sim2
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


module andgate_sim2( );
//input
reg a = 0;
reg b = 0;
//output
wire c;
andgate #(1) u(a,b,c);
initial begin
#100 a = 1;
#100 begin a = 0; b = 1; end
#100 a = 1;
end
endmodule
