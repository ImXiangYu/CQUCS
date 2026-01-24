`timescale 1ns / 1ps

module top_FIFO#(parameter DATA_WIDTH = 4,parameter ADDR_DEPTH = 4)(
    input button,clk,rst,wr_en,rd_en,
    input [DATA_WIDTH-1:0]data_in,
    output empty,full, 
    output wire[3:0]an,
    output wire[6:0]display
    );
    wire button_deb;
    wire[DATA_WIDTH-1:0]data_out;
    wire clk_div;
    reg [25:0]target = 50000;
    wire [15:0]BCD;
    //divider
    divider d(.clk(clk),.rst(rst),.target(target),.clk_div(clk_div));
    //debkey
    debkey deb(.clk(clk),.rst(rst),.key_in(button),.key_out(button_deb));
    //FIFO
    FIFO F(.clk(button_deb),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.empty(empty),.full(full),.data_out(data_out));
    //transformer
    transformer t(.data(data_out),.BCD(BCD));
    //display7seg
    display7seg dis(.clk(clk_div),.data3(BCD[15:12]),.data2(BCD[11:8]),.data1(BCD[7:4]),.data0(BCD[3:0]),.an(an),.display(display));    
endmodule
