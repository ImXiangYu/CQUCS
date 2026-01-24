`timescale 1ns / 1ps



module design_1_sim(

    );
    reg a = 0;
    reg b = 0;
    reg c = 0;
    reg d = 0;
    reg S1 = 0;
    reg S2 = 0;
    wire e;
    design_1 u(.a(a),.b(b),.c(c),.d(d),.S1(S1),.S2(S2),.e(e));
    initial begin
        #100 a = 1;
        #100 a = 0;
        #100 begin
            S1 = 1;
            b = 1;
        end
        #100 b = 0;
        #100 begin
            S2 = 1;
            S1 = 0;
            c = 1;
        end
        #100 c = 0;
        #100 begin
            S1 = 1;
            d = 1;
        end
        #100 d = 0;
    end

endmodule
