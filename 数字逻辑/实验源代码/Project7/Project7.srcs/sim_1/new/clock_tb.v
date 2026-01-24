`timescale 1ns / 1ps

module clock_tb();
    reg clk,rst;
    wire[3:0] h2,h1,m2,m1,s2,s1; 
    clock_conut u1(clk,rst,h2,h1,m2,m1,s2,s1);
    always #5 clk=~clk;  
    initial  
    begin  
        clk=0;
        rst=1;
        #10 rst=0;  
    end  
endmodule
