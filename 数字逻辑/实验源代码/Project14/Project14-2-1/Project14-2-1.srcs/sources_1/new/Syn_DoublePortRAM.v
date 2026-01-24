`timescale 1ns / 1ps

module Syn_DoublePortRAM#(parameter DATA_WIDTH = 4,parameter ADDR_DEPTH = 3)(
    input clk,rst,
    input [ADDR_DEPTH-1:0]addr_a,addr_b,
    input [DATA_WIDTH-1:0]din_a,din_b,
    input we_a,we_b,
    output reg[DATA_WIDTH-1:0]dout_a,dout_b,
    output reg error//错误检测
    );
    reg [DATA_WIDTH-1:0] RAM[(1<<ADDR_DEPTH)-1:0];
    //error detect
    always @(posedge clk)
    begin
        if(rst)
        begin
            error <= 0;
        end
        else if(!we_a&&!we_b&&(addr_a==addr_b))//地址相同时只能进行read
            error <= 0;
        else if(addr_a!=addr_b)//地址不同
            error <= 0;
        else
            error <= 1;//error指示灯亮
    end
    //write
    integer i;
    always @(posedge clk) 
    begin
        if(rst)//init
        begin
            for(i=0;i<(1<<ADDR_DEPTH);i = i+1)
            begin
                RAM[i] <= 0;
            end
        end
        else if(we_a&&!we_b&&(addr_a!=addr_b))
            RAM[addr_a] = din_a;
        else if(!we_a&&we_b&&(addr_a!=addr_b))
            RAM[addr_b] = din_b;
        else if(we_a&&we_b&&(addr_a!=addr_b))
        begin
            RAM[addr_a] = din_a;
            RAM[addr_b] = din_b;
        end
    end
    //read
    //syn_a
    always @(posedge clk) 
    begin
        if(rst)
        begin
            dout_a <= 0;
        end
        else if(!we_a)
        begin
            dout_a <= RAM[addr_a];
        end
        else
            dout_a <= 0;
    end

    // syn_b
    always @(posedge clk) 
    begin
        if(rst)
        begin
            dout_b <= 0;
        end
        else if(!we_b)
        begin
            dout_b <= RAM[addr_b];
        end
        else
            dout_b <= 0;            
    end  
endmodule