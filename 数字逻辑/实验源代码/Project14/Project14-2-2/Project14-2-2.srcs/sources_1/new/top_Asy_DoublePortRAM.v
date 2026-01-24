`timescale 1ns / 1ps

module top_Asy_DoublePortRAM#(parameter DATA_WIDTH = 3,parameter ADDR_DEPTH = 3)(
    input clk,rst,
    input [ADDR_DEPTH-1:0]addr_a,addr_b,
    input [DATA_WIDTH-1:0]din_a,din_b,
    input we_a,we_b,
    output wire[3:0]an,
    output wire[6:0]display,
    output wire error//错误检测灯
    );

    wire[DATA_WIDTH-1:0]dout_a,dout_b;
    wire clk_div;
    reg [25:0]target = 50000;
    wire [15:0]BCD_a;
    wire [15:0]BCD_b;

    //divider
    divider d(.clk(clk),
              .rst(rst),
              .target(target),
              .clk_div(clk_div));

    //Syn_DoublePortRAM
    Asy_DoublePortRAM S(.clk(clk),
                        .rst(rst),
                        .addr_a(addr_a),
                        .addr_b(addr_b),
                        .din_a(din_a),
                        .din_b(din_b),
                        .we_a(we_a),
                        .we_b(we_b),
                        .dout_a(dout_a),
                        .dout_b(dout_b),
                        .error(error));

    //transformer
    transformer t_a(.data(dout_a),.BCD(BCD_a));
    transformer t_b(.data(dout_b),.BCD(BCD_b));
    //display7seg
    display7seg dis(.clk(clk_div),.data3(BCD_a[7:4]),.data2(BCD_a[3:0]),.data1(BCD_b[7:4]),.data0(BCD_b[3:0]),.an(an),.display(display));
endmodule
