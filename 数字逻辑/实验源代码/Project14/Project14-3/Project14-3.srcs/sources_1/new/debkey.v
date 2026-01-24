`timescale 1ns / 1ps

module debkey(
    input clk,
    input rst,
    input key_in,
    output key_out
    );
    parameter T100Hz = 249999;
    integer cnt_100Hz;
    reg clk_100Hz;
    always @(posedge clk) begin
        if(rst)
            cnt_100Hz<=32'b0;
        else
        begin
            cnt_100Hz<=cnt_100Hz+1'b1;
            if(cnt_100Hz==T100Hz)
            begin
                cnt_100Hz<=32'b0;
                clk_100Hz<=~clk_100Hz;
            end
        end
    end

    reg[2:0]key_rrr,key_rr,key_r;
    always @(posedge clk_100Hz) begin
        if(rst)
            begin
                key_rrr<=1'b1;
                key_rr<=1'b1;
                key_r<=1'b1;
            end
        else
        begin
            key_rrr<=key_rr;
            key_rr<=key_r;
            key_r<=key_in;
        end
    end
    assign key_out = key_rrr&key_rr&key_r;

endmodule
