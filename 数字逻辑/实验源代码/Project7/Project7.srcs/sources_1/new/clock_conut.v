`timescale 1ns / 1ps

module clock_conut(
    input clk,rst,
    output reg[3:0] Hour_2,Hour_1,Minute_2,Minute_1,Second_2,Second_1
    );
    //Second_1 % 10
    always @(posedge clk) begin
        //rst
        if(rst)
            Second_1 <= 4'b0000;
        //进位
        else if(Second_1==4'b1001)
            Second_1 <= 4'b0000;
        else
            Second_1 <= Second_1 + 4'b0001;
    end
    //Second_2 % 6
    always @(posedge clk) begin
        //rst
        if(rst)
            Second_2 <= 4'b0000;
        //进位
        else if(Second_1==4'b1001)//Second_1进位
            begin
                if(Second_2 == 4'b0101)//Second_2==5
                    Second_2<=4'b0000;
                else
                    Second_2<=Second_2+4'b0001;
            end
    end
    //Minute_1 % 10
    always @(posedge clk) begin
        if(rst)
            Minute_1 <= 4'b0000;
        else if(Second_2 == 4'b0101&&Second_1==4'b1001)
            begin
                if(Minute_1==4'b1001)
                    Minute_1 <= 4'b0000;
                else
                    Minute_1 <= Minute_1+4'b0001;
            end
    end
    //Minute_2 % 6
    always @(posedge clk) begin
        if(rst)
            Minute_2 <= 4'b0000;
        else if(Second_2 == 4'b0101&&Second_1==4'b1001)
            begin
                if(Minute_1==4'b1001)
                begin
                    if(Minute_2==4'b0101)
                        Minute_2<=4'b0000;
                    else
                        Minute_2 <= Minute_2+4'b0001;
                end
            end
    end
    //Hour_1 % 10 最后为4
    always @(posedge clk) begin
        if(rst)
            Hour_1 <= 4'b0000;
        else if(Second_2 == 4'b0101&&Second_1==4'b1001&&Minute_2==4'b0101&&Minute_1==4'b1001)
            begin
                if(Hour_2==4'b0010&&Hour_1==4'b0011)//23:59:59
                    Hour_1 <= 4'b0000;
                else if(Hour_1 == 4'b1001)
                    Hour_1 <= 4'b0000;
                else
                    Hour_1 <= Hour_1 + 4'b0001;
            end
    end
    //Hour_2 % 3
    always @(posedge clk) begin
        if(rst)
            Hour_2 <= 4'b0000;
        else if(Second_2 == 4'b0101&&Second_1==4'b1001&&Minute_2==4'b0101&&Minute_1==4'b1001)
            begin
                if(Hour_2==4'b0010&&Hour_1==4'b0011)//23:59:59
                    Hour_2 <= 4'b0000;
                else if(Hour_1 == 4'b1001)
                    Hour_2 <= Hour_2+4'b0001;
            end
    end
endmodule
