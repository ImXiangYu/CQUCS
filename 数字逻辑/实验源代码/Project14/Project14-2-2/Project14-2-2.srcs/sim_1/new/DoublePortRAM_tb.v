`timescale 1ns / 1ps

module DoublePortRAM_tb();
    reg clk,we1,we2,rst;
    reg [3:0] addr1;
    reg [3:0] addr2;
    reg [1:0] d_in1;
    reg [1:0] d_in2; 
    wire [1:0] d_out1;
    wire [1:0] d_out2;
    wire error;


    Asy_DoublePortRAM #(4,3) utt(
        .clk(clk),.rst(rst),
        .addr_a(addr1), .addr_b(addr2),
        .din_a(d_in1), .din_b(d_in2),
        .we_a(we1), .we_b(we2),
        .dout_a(d_out1), .dout_b(d_out2),
        .error(error));

    always #5 clk = ~clk;

    integer i;

    initial begin
        rst = 0;
        clk = 0;
        we1 = 0;
        we2 = 0;
        addr1 = 0;
        addr2 = 0;
        d_in1 = 0;
        d_in2 = 0;

        @(negedge clk)
        begin
            we1 = 1;
            we2 = 1;
        end

        for (i=0;i<8;i=i+1)
        begin
            @(negedge clk)
            begin
                addr1 = i;
                d_in1 = i;
                addr2 = i;
                d_in2 = i;
            end
        end

        for (i=8;i<16;i=i+1)
        begin
            @(negedge clk)
            begin
                addr1 = i;
                d_in1 = i;
                addr2 = i+1;
                d_in2 = i;
            end
        end

        @(negedge clk)
        begin
            we1 = 1;
            we2 = 0;
        end

        for (i=0;i<16;i=i+1)
        begin
            @(negedge clk)
            begin
                addr1 = i;
                d_in1 = i;
                addr2 = i+1;
            end
        end

        @(negedge clk)
        begin
            we1 = 0;
            we2 = 1;
        end

        for (i=0;i<8;i=i+1)
        begin
            @(negedge clk)
            begin
                addr1 = i;
                d_in2 = i;
                addr2 = i;
            end
        end

        for (i=8;i<16;i=i+1)
        begin
            @(negedge clk)
            begin
                addr1 = i;
                d_in2 = i;
                addr2 = i+1;
            end
        end

        @(negedge clk)
        begin
            we1 = 0;
            we2 = 0;
        end

        for (i=0;i<16;i=i+1)
        begin
            @(negedge clk)
            begin
                addr1 = i;
                addr2 = i;
            end
        end

        $stop;       

    end 
endmodule