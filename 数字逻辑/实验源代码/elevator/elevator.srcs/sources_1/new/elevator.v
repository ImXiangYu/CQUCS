`timescale 1ns / 1ps

module elevator(clk, reset, btn, an, segs, nfloor, open);
    input clk, reset;
    input [4:0] btn;        //{BTND, BTNR, BTNC, BTNL, BTNU}
    output reg [3:0] an;
    output reg [6:0] segs; //当前层数
    output [4:0] nfloor;   //电梯呼叫显示
    output reg open;       //电梯门开关

    //按键消抖加按键赋值，每200ms读取一次
    wire clk_200ms;
    clock_div #(5, 9999_9999) u1(clk, reset, clk_200ms);

    reg [4:0] btn_pre_re=5'b00000, btn_off=5'b11111;
    always @(posedge clk_200ms or negedge reset) begin
        if(!reset)
            btn_pre_re = 0;
        else begin
        btn_pre_re = btn_pre_re ^ btn;       //异或，连续两次按键取消呼叫
        btn_pre_re = btn_pre_re & btn_off;   //用于清除已到达的楼层呼叫
        end
    end

    //分频为1s
    wire clk_1s;
    clock_div #(1, 9999_9999) u2(clk, reset, clk_1s);

    parameter T_1s = 9999_9999;
    parameter floor1=5'b00001, floor2=5'b00010, floor3=5'b00100, floor4=5'b01000, floor5=5'b10000;
    parameter up=2'b00, down=2'b01, stay=2'b11;
    reg [1:0] curr_state, next_state;
    reg [4:0] now_btn;
    reg [4:0] curr_floor, next_floor, temp_floor;

    initial begin
        curr_state <= stay;
        curr_floor <= floor1;
        open <= 1;
    end

    always @(posedge clk_1s) begin
        now_btn = btn_pre_re;
        temp_floor = curr_floor;
        case(curr_state)
            stay: begin
                if (now_btn > curr_floor) begin
                    #(10*T_1s);
                    curr_state = up;
                end
                if (now_btn == curr_floor) begin
                    now_btn = now_btn & ~temp_floor;   //当前呼叫清零
                    btn_off = ~temp_floor;
                    open = 1;
                    #(10*T_1s);
                    open = 0;
                    curr_state = stay;
                end
                if ((now_btn<curr_floor) && (now_btn>0)) begin
                    #(10*T_1s);
                    curr_state = down;
                end
            end
            up: begin
                now_btn = now_btn & ~temp_floor;   //呼叫清零
                btn_off = ~temp_floor;
                if(now_btn > curr_floor) begin
                    if(now_btn == next_floor)
                        curr_state = stay;
                    else
                        curr_state = up;
                end
                else if(now_btn == curr_floor) begin
                    open = 1;
                    #(10*T_1s);
                    open = 0;
                    curr_state = stay;
                end
            end
            down: begin
                now_btn = now_btn & ~temp_floor;   //呼叫清零
                btn_off = ~temp_floor;
                if (now_btn < curr_floor) begin
                    if(now_btn == next_floor)
                        curr_state = stay;
                    else
                        curr_state = down;
                end
                else if(now_btn == curr_floor) begin
                    open = 1;
                    #(10*T_1s);
                    open = 0;
                    curr_state = stay;
                end
            end
        endcase
    end

    //楼层的摩尔状态机
    always @(posedge clk_1s or negedge reset) begin
        if(!reset) curr_floor <= floor1;
        else curr_floor <= next_floor;
    end

    always @(curr_floor or curr_state) begin
        case(curr_floor)
            floor1: begin
                if(curr_state == up) next_floor = floor2;
                else next_floor = floor1;
            end
            floor2: begin
                if(curr_state == up) next_floor = floor3;
                else if(curr_state == down) next_floor = floor1;
                else next_floor = floor2;
            end
            floor3: begin
                if(curr_state == up) next_floor = floor4;
                else if(curr_state == down) next_floor = floor2;
                else next_floor = floor3;
            end
            floor4: begin
                if(curr_state == up) next_floor = floor5;
                else if(curr_state == down) next_floor = floor3;
                else next_floor = floor4;
            end
            floor5: begin
                if(curr_state == down) next_floor = floor4;
                else next_floor = floor5;
            end
        endcase
    end

    //当前楼层七段数码管显示
    always @(curr_floor) begin
        an = 4'b1110;
        case(curr_floor)  //gfe_dcba
            floor1: segs = 7'b111_1001;
            floor2: segs = 7'b010_0100;
            floor3: segs = 7'b011_0000;
            floor4: segs = 7'b001_1001;
            floor5: segs = 7'b001_0010;
            default: segs = 7'b111_1111;
        endcase
    end

    //楼层呼叫状态显示
    assign nfloor = btn_pre_re;
endmodule

