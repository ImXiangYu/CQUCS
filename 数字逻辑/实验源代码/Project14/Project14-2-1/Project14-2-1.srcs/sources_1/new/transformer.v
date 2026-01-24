`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/01 22:25:06
// Design Name: 
// Module Name: transformer
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


module transformer(
    input [3:0] data,
    output [15:0]BCD//四位，方便输入至数码管
    );
    //移位加3，转换成BCD
    reg [19:0] transfor_data;
    always @(*) 
    begin
        transfor_data = 16'b0;
        transfor_data[3:0] = data;
        repeat(4)
        begin
            if(transfor_data[19:16]>4)
                transfor_data[19:16] = transfor_data[19:16]+2'b11;
            if(transfor_data[15:12]>4)
                transfor_data[15:12] = transfor_data[15:12]+2'b11;
            if(transfor_data[11:8]>4)
                transfor_data[11:8] = transfor_data[11:8]+2'b11; 
            if(transfor_data[7:4]>4)     
                transfor_data[7:4] = transfor_data[7:4]+2'b11;      
            transfor_data[19:1] = transfor_data[18:0];
        end
    end
    assign BCD = transfor_data[19:4];
endmodule
