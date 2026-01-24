`timescale 1ns / 1ps

module transformer_tb(

    );
    reg [3:0] data;
    wire [15:0] BCD;
    transformer t(.data(data),.BCD(BCD));
    initial begin
        #10 data = 4'b1111;
        #10 data = 4'b1010;
    end
endmodule
