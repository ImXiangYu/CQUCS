`timescale 1ns / 1ps



module design_1_sim_2(

    );
    parameter size = 10000;
    reg a = 0;
    reg b = 0;
    reg c = 0;
    reg d = 0;
    reg S1 = 0;
    reg S2 = 0;
    wire e;
    design_1 u(.a(a),.b(b),.c(c),.d(d),.S1(S1),.S2(S2),.e(e));
    initial begin
        a = 'd0;
        b = 'd0;
        c = 'd0;
        d = 'd0;
        S1 = 'd0;
        S2 = 'd0;
        repeat(size)
        begin
            #10
            a = $random;
            b = $random;
            c = $random;
            d = $random;
            S1 = $random;
            S2 = $random;
        end
    end
endmodule
