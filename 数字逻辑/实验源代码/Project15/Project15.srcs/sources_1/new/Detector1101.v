`timescale 1ns / 1ps

module Detector1101(
    input clk,rst,din,
    output reg dout
    );
    reg[2:0] state,next_state;
    parameter S0 = 3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
    always @(posedge clk) begin
        if(rst)
            state<=3'b000;
        else
            state<=next_state;
    end
    always @(state or din) begin
        case(state)
        S0:begin
            if(din==1)
                next_state=S1;
            else
                next_state=S0; 
        end
        S1:begin
            if(din==1)
                next_state=S2;
            else
                next_state=S0; 
        end
        S2:begin
            if(din==1)
                next_state=S2;
            else
                next_state=S3; 
        end
        S3:begin
            if(din==1)
                next_state=S4;
            else
                next_state=S0; 
        end
        S4:begin
            if(din==1)
                next_state=S2;
            else
                next_state=S0; 
        end
        default: next_state=S0;
        endcase
    end
    always @(state) begin
        case(state)
        S4: dout = 1'b1;
        default:dout = 1'b0;
        endcase
    end
endmodule
