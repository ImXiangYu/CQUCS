`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/01 23:07:38
// Design Name: 
// Module Name: display7seg
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


module display7seg(
    input clk,
    input [3:0]data3,data2,data1,data0,
    output reg[3:0]an,
    output reg[6:0]display
    );
    reg [1:0] count;
    always @(posedge clk) begin
        if(count == 'b11)
            count <= 0;
        else
            count <= count +'b1;
    end
    always @(posedge clk) begin
        case(count)
        2'b00: an <= 4'b1110;
        2'b01: an <= 4'b1101;
        2'b10: an <= 4'b1011;
        2'b11: an <= 4'b0111;
        endcase
    end
    always @(posedge clk) begin
        case(count)
            2'b00:
            case (data0)
                4'b0000:display = 7'b0000001;
                4'b0001:display = 7'b1001111;
                4'b0010:display = 7'b0010010;
                4'b0011:display = 7'b0000110;
                4'b0100:display = 7'b1001100;
                4'b0101:display = 7'b0100100;
                4'b0110:display = 7'b0100000;
                4'b0111:display = 7'b0001111;
                4'b1000:display = 7'b0000000;
                4'b1001:display = 7'b0000100;    
            endcase
            2'b01:
            case (data1)
                4'b0000:display = 7'b0000001;
                4'b0001:display = 7'b1001111;
                4'b0010:display = 7'b0010010;
                4'b0011:display = 7'b0000110;
                4'b0100:display = 7'b1001100;
                4'b0101:display = 7'b0100100;
                4'b0110:display = 7'b0100000;
                4'b0111:display = 7'b0001111;
                4'b1000:display = 7'b0000000;
                4'b1001:display = 7'b0000100;    
            endcase
            2'b10:
            case (data2)
                4'b0000:display = 7'b0000001;
                4'b0001:display = 7'b1001111;
                4'b0010:display = 7'b0010010;
                4'b0011:display = 7'b0000110;
                4'b0100:display = 7'b1001100;
                4'b0101:display = 7'b0100100;
                4'b0110:display = 7'b0100000;
                4'b0111:display = 7'b0001111;
                4'b1000:display = 7'b0000000;
                4'b1001:display = 7'b0000100;    
            endcase
            2'b11:
            case (data3)
                4'b0000:display = 7'b0000001;
                4'b0001:display = 7'b1001111;
                4'b0010:display = 7'b0010010;
                4'b0011:display = 7'b0000110;
                4'b0100:display = 7'b1001100;
                4'b0101:display = 7'b0100100;
                4'b0110:display = 7'b0100000;
                4'b0111:display = 7'b0001111;
                4'b1000:display = 7'b0000000;
                4'b1001:display = 7'b0000100;    
            endcase
        endcase
    end
endmodule
