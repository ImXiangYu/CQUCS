`timescale 1ps / 1ps

module clock
(
    input clk,rst,second_select,
    output reg[10:0] display
);

    reg[3:0] Hour_2,Hour_1,Minute_2,Minute_1,Second_2,Second_1;
    reg[26:0] count = 0;
    reg[15:0] count2 = 0;
    reg[2:0] sel = 0;

    parameter T = 10000000;
    parameter T2 = 50000;

    reg clk2 = 1'b0;

    //时间
    always @(posedge clk) begin
        if(rst)
            count<='b0;
        else if(count == T)
        begin
            clk2 <= ~clk2;
            count <= 0;
        end
        else count <= count + 'b1;
    end

    //Second_1 % 10
    always @(posedge clk2) begin
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
    always @(posedge clk2) begin
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
    always @(posedge clk2) begin
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
    always @(posedge clk2) begin
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
    always @(posedge clk2) begin
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
    always @(posedge clk2) begin
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

    //显示
    always @(posedge clk) begin
        if(rst)
            count2<='b0;
        else if(count2==T2)
            begin
                count2<=0;
                sel<=sel+1;
                if(sel==4)
                    sel<=0;
            end        
        else
            count2 <=count2+1;
    end
    
    always @(posedge clk) begin
        //显示秒
        if(second_select)
            begin
                case(sel)
                //Second_1 0~9
                0,1: begin
                    case(Second_1)
                        4'b0000:display = 11'b1110_0000001;
                        4'b0001:display = 11'b1110_1001111;
                        4'b0010:display = 11'b1110_0010010;
                        4'b0011:display = 11'b1110_0000110;
                        4'b0100:display = 11'b1110_1001100;
                        4'b0101:display = 11'b1110_0100100;
                        4'b0110:display = 11'b1110_0100000;
                        4'b0111:display = 11'b1110_0001111;
                        4'b1000:display = 11'b1110_0000000;
                        4'b1001:display = 11'b1110_0000100;
                    endcase
                end
                //Second_2 0~5
                2,3:begin
                    case(Second_2)
                        4'b0000:display = 11'b1101_0000001;
                        4'b0001:display = 11'b1101_1001111;
                        4'b0010:display = 11'b1101_0010010;
                        4'b0011:display = 11'b1101_0000110;
                        4'b0100:display = 11'b1101_1001100;
                        4'b0101:display = 11'b1101_0100100;
                    endcase
                end
                endcase
            end
        //显示小时和分钟
        else
            begin
                case(sel)
                //Minute_1 0~9
                0:begin
                    case(Minute_1)
                        4'b0000:display = 11'b1110_0000001;
                        4'b0001:display = 11'b1110_1001111;
                        4'b0010:display = 11'b1110_0010010;
                        4'b0011:display = 11'b1110_0000110;
                        4'b0100:display = 11'b1110_1001100;
                        4'b0101:display = 11'b1110_0100100;
                        4'b0110:display = 11'b1110_0100000;
                        4'b0111:display = 11'b1110_0001111;
                        4'b1000:display = 11'b1110_0000000;
                        4'b1001:display = 11'b1110_0000100;
                    endcase
                end
                //Minute_2 0~5
                1:begin
                    case(Minute_2)
                        4'b0000:display = 11'b1101_0000001;
                        4'b0001:display = 11'b1101_1001111;
                        4'b0010:display = 11'b1101_0010010;
                        4'b0011:display = 11'b1101_0000110;
                        4'b0100:display = 11'b1101_1001100;
                        4'b0101:display = 11'b1101_0100100;
                    endcase
                end
                //Hour_1 0~9
                2:begin
                    case(Hour_1)
                        4'b0000:display = 11'b1011_0000001;
                        4'b0001:display = 11'b1011_1001111;
                        4'b0010:display = 11'b1011_0010010;
                        4'b0011:display = 11'b1011_0000110;
                        4'b0100:display = 11'b1011_1001100;
                        4'b0101:display = 11'b1011_0100100;
                        4'b0110:display = 11'b1011_0100000;
                        4'b0111:display = 11'b1011_0001111;
                        4'b1000:display = 11'b1011_0000000;
                        4'b1001:display = 11'b1011_0000100;
                    endcase
                end
                //Hour_2
                3:begin
                    case(Hour_2)
                        4'b0000:display = 11'b0111_0000001;
                        4'b0001:display = 11'b0111_1001111;
                        4'b0010:display = 11'b0111_0010010;
                    endcase
                end
                endcase
            end
    end
endmodule
