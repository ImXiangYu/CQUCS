`timescale 1ns / 1ps

module top_Detector1101(
    input button,clk,rst,in,
    input [7:0]din,
    output flag,
    output wire[3:0]an,
    output wire[6:0]display
    );
    reg [25:0]target = 50000;
    wire button_deb;
    wire dout;
    wire clk_div;
    wire [3:0]dout_display;
    //debkey
    debkey deb(.clk(clk),.rst(rst),.key_in(button),.key_out(button_deb));
    //PISO
    PISO P(.clk(button_deb),.rst(rst),.in(in),.din(din),.dout(dout));
    //SIPO
    SIPO S(.clk(button_deb),.rst(rst),.din(dout),.dout(dout_display));
    //Detector1011
    Detector1101 D(.clk(button_deb),.rst(rst),.din(dout),.dout(flag));
    //divider
    divider d(.clk(clk),.rst(rst),.target(target),.clk_div(clk_div));
    //display7seg
    display7seg dis(.clk(clk_div),.data3(dout_display[3]),.data2(dout_display[2]),.data1(dout_display[1]),.data0(dout_display[0]),.an(an),.display(display));    
endmodule
