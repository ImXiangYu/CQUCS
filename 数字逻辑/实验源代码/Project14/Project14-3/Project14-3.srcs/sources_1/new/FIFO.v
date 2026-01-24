`timescale 1ns / 1ps

module FIFO#(parameter DATA_WIDTH = 4,parameter ADDR_DEPTH = 4)(
    input clk,rst,wr_en,rd_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg empty,full,
    output reg[DATA_WIDTH-1:0] data_out
    );
    reg [DATA_WIDTH-1:0] FIFO[(1<<ADDR_DEPTH) - 1:0]; 
    reg [ADDR_DEPTH-1:0]head;
    reg [ADDR_DEPTH-1:0]rear;
    reg [ADDR_DEPTH:0]NUM;
       
    //empty
    always @(*) begin
        if(NUM==0)
            empty<=1;
        else
            empty<=0;
    end
    //full
    always @(*) begin
        if(NUM==(1<<ADDR_DEPTH))
            full<=1;
        else
            full<=0;
    end
    //NUM
    always @(posedge clk or posedge rst) begin
        if(rst)
            NUM<=0;
        else if(!wr_en&&!rd_en)//no write no read
            NUM<=NUM;
        else if(wr_en&&!rd_en&&(NUM<(1<<ADDR_DEPTH)))//wirte no read
            NUM<=NUM+'b1;
        else if(!wr_en&&rd_en&&(NUM>0))//read no write
            NUM<=NUM-'b1; 
        else if(wr_en&&rd_en)
            NUM<=NUM;
    end
    //write
    integer i;
    always @(posedge clk or posedge rst) begin
        if(rst)
        begin
            rear<='b0;
            for(i=0;i<(1<<ADDR_DEPTH);i=i+1)
                FIFO[i]<=0;
        end
        else if(wr_en&&(NUM<(1<<ADDR_DEPTH)))//not full
        begin
            FIFO[rear]<=data_in;
            rear<=(rear+1)%(1<<ADDR_DEPTH);
        end
        else if(wr_en&&(NUM>(1<<ADDR_DEPTH)-1))//full
            rear<=rear;

    end
    //read
    always @(posedge clk or posedge rst) begin
        if(rst)
        begin
            head<='b0;
            data_out<=0;
        end
            
        else if(rd_en&&(NUM!=0))
        begin
            data_out<=FIFO[head];
            head<=(head+1)%(1<<ADDR_DEPTH);
        end
        else if(NUM==0)
            data_out<=0;
    end
endmodule
