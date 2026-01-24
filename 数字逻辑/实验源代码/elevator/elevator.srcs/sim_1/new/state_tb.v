`timescale 1ns / 1ps

module state_tb();
    reg clk, reset;
    reg [4:0] btn;
    wire reg [4:0] curr_state;
    wire reg [4:0] btn_off;

    state us(clk, reset, btn, curr_state, btn_off);

    initial begin
        clk = 0;
        btn = 5'b00001;
        reset = 1;
        #400 btn = 5'b01000;
    end

    always #5 clk = ~clk;
endmodule
