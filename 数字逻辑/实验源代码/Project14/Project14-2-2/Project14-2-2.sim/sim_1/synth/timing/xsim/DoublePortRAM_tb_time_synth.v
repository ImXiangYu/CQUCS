// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Nov 25 21:46:43 2022
// Host        : Unicx running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/thatcher/Desktop/Project14-2-2/Project14-2-2.sim/sim_1/synth/timing/xsim/DoublePortRAM_tb_time_synth.v
// Design      : top_Asy_DoublePortRAM
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Asy_DoublePortRAM
   (error_OBUF,
    \count_reg[1] ,
    \count_reg[0] ,
    \count_reg[0]_0 ,
    \count_reg[1]_0 ,
    \count_reg[1]_1 ,
    \addr_b[2] ,
    \count_reg[0]_1 ,
    \count_reg[0]_2 ,
    \addr_b[2]_0 ,
    \addr_b[2]_1 ,
    clk_IBUF_BUFG,
    we_a_IBUF,
    we_b_IBUF,
    rst_IBUF,
    addr_b_IBUF,
    addr_a_IBUF,
    Q,
    \display_reg[4] ,
    oe_a_IBUF,
    \display_reg[4]_0 ,
    \display_reg[2] ,
    \display_reg[0] ,
    oe_b_IBUF,
    din_b_IBUF,
    din_a_IBUF);
  output error_OBUF;
  output \count_reg[1] ;
  output \count_reg[0] ;
  output \count_reg[0]_0 ;
  output \count_reg[1]_0 ;
  output \count_reg[1]_1 ;
  output \addr_b[2] ;
  output \count_reg[0]_1 ;
  output \count_reg[0]_2 ;
  output \addr_b[2]_0 ;
  output \addr_b[2]_1 ;
  input clk_IBUF_BUFG;
  input we_a_IBUF;
  input we_b_IBUF;
  input rst_IBUF;
  input [2:0]addr_b_IBUF;
  input [2:0]addr_a_IBUF;
  input [1:0]Q;
  input \display_reg[4] ;
  input oe_a_IBUF;
  input \display_reg[4]_0 ;
  input \display_reg[2] ;
  input \display_reg[0] ;
  input oe_b_IBUF;
  input [2:0]din_b_IBUF;
  input [2:0]din_a_IBUF;

  wire [1:0]Q;
  wire \RAM[0][0]_i_1_n_0 ;
  wire \RAM[0][1]_i_1_n_0 ;
  wire \RAM[0][2]_i_1_n_0 ;
  wire \RAM[0][2]_i_2_n_0 ;
  wire \RAM[0][2]_i_3_n_0 ;
  wire \RAM[0][2]_i_4_n_0 ;
  wire \RAM[0][2]_i_5_n_0 ;
  wire \RAM[1][0]_i_1_n_0 ;
  wire \RAM[1][1]_i_1_n_0 ;
  wire \RAM[1][2]_i_1_n_0 ;
  wire \RAM[1][2]_i_2_n_0 ;
  wire \RAM[1][2]_i_3_n_0 ;
  wire \RAM[1][2]_i_4_n_0 ;
  wire \RAM[1][2]_i_5_n_0 ;
  wire \RAM[2][0]_i_1_n_0 ;
  wire \RAM[2][1]_i_1_n_0 ;
  wire \RAM[2][2]_i_1_n_0 ;
  wire \RAM[2][2]_i_2_n_0 ;
  wire \RAM[2][2]_i_3_n_0 ;
  wire \RAM[2][2]_i_4_n_0 ;
  wire \RAM[2][2]_i_5_n_0 ;
  wire \RAM[3][0]_i_1_n_0 ;
  wire \RAM[3][1]_i_1_n_0 ;
  wire \RAM[3][2]_i_1_n_0 ;
  wire \RAM[3][2]_i_2_n_0 ;
  wire \RAM[3][2]_i_3_n_0 ;
  wire \RAM[3][2]_i_4_n_0 ;
  wire \RAM[3][2]_i_5_n_0 ;
  wire \RAM[4][0]_i_1_n_0 ;
  wire \RAM[4][1]_i_1_n_0 ;
  wire \RAM[4][2]_i_1_n_0 ;
  wire \RAM[4][2]_i_2_n_0 ;
  wire \RAM[4][2]_i_3_n_0 ;
  wire \RAM[4][2]_i_4_n_0 ;
  wire \RAM[4][2]_i_5_n_0 ;
  wire \RAM[5][0]_i_1_n_0 ;
  wire \RAM[5][1]_i_1_n_0 ;
  wire \RAM[5][2]_i_1_n_0 ;
  wire \RAM[5][2]_i_2_n_0 ;
  wire \RAM[5][2]_i_3_n_0 ;
  wire \RAM[5][2]_i_4_n_0 ;
  wire \RAM[5][2]_i_5_n_0 ;
  wire \RAM[6][0]_i_1_n_0 ;
  wire \RAM[6][1]_i_1_n_0 ;
  wire \RAM[6][2]_i_1_n_0 ;
  wire \RAM[6][2]_i_2_n_0 ;
  wire \RAM[6][2]_i_3_n_0 ;
  wire \RAM[6][2]_i_4_n_0 ;
  wire \RAM[6][2]_i_5_n_0 ;
  wire \RAM[7][0]_i_1_n_0 ;
  wire \RAM[7][1]_i_1_n_0 ;
  wire \RAM[7][2]_i_1_n_0 ;
  wire \RAM[7][2]_i_2_n_0 ;
  wire \RAM[7][2]_i_3_n_0 ;
  wire \RAM[7][2]_i_4_n_0 ;
  wire \RAM[7][2]_i_5_n_0 ;
  wire [2:0]\RAM_reg[0] ;
  wire [2:0]\RAM_reg[1] ;
  wire [2:0]\RAM_reg[2] ;
  wire [2:0]\RAM_reg[3] ;
  wire [2:0]\RAM_reg[4] ;
  wire [2:0]\RAM_reg[5] ;
  wire [2:0]\RAM_reg[6] ;
  wire [2:0]\RAM_reg[7] ;
  wire [2:0]addr_a_IBUF;
  wire \addr_b[2] ;
  wire \addr_b[2]_0 ;
  wire \addr_b[2]_1 ;
  wire [2:0]addr_b_IBUF;
  wire clk_IBUF_BUFG;
  wire \count_reg[0] ;
  wire \count_reg[0]_0 ;
  wire \count_reg[0]_1 ;
  wire \count_reg[0]_2 ;
  wire \count_reg[1] ;
  wire \count_reg[1]_0 ;
  wire \count_reg[1]_1 ;
  wire [2:0]din_a_IBUF;
  wire [2:0]din_b_IBUF;
  wire \display[0]_i_2_n_0 ;
  wire \display[1]_i_2_n_0 ;
  wire \display[1]_i_3_n_0 ;
  wire \display[2]_i_2_n_0 ;
  wire \display[2]_i_5_n_0 ;
  wire \display[2]_i_6_n_0 ;
  wire \display[3]_i_2_n_0 ;
  wire \display[4]_i_10_n_0 ;
  wire \display[4]_i_3_n_0 ;
  wire \display[4]_i_4_n_0 ;
  wire \display[4]_i_6_n_0 ;
  wire \display[4]_i_7_n_0 ;
  wire \display[4]_i_8_n_0 ;
  wire \display[4]_i_9_n_0 ;
  wire \display[5]_i_2_n_0 ;
  wire \display[6]_i_10_n_0 ;
  wire \display[6]_i_11_n_0 ;
  wire \display[6]_i_12_n_0 ;
  wire \display[6]_i_13_n_0 ;
  wire \display[6]_i_14_n_0 ;
  wire \display[6]_i_2_n_0 ;
  wire \display[6]_i_3_n_0 ;
  wire \display[6]_i_4_n_0 ;
  wire \display[6]_i_5_n_0 ;
  wire \display[6]_i_9_n_0 ;
  wire \display_reg[0] ;
  wire \display_reg[1]_i_4_n_0 ;
  wire \display_reg[1]_i_5_n_0 ;
  wire \display_reg[2] ;
  wire \display_reg[4] ;
  wire \display_reg[4]_0 ;
  wire \display_reg[4]_i_11_n_0 ;
  wire error_OBUF;
  wire error_i_1_n_0;
  wire error_i_2_n_0;
  wire oe_a_IBUF;
  wire oe_b_IBUF;
  wire rst_IBUF;
  wire we_a_IBUF;
  wire we_b_IBUF;

  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[0][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[0][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[0][2]_i_3_n_0 ),
        .I4(\RAM_reg[0] [0]),
        .O(\RAM[0][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[0][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[0][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[0][2]_i_3_n_0 ),
        .I4(\RAM_reg[0] [1]),
        .O(\RAM[0][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[0][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[0][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[0][2]_i_3_n_0 ),
        .I4(\RAM_reg[0] [2]),
        .O(\RAM[0][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h010101010100FF01)) 
    \RAM[0][2]_i_2 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[0][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[0][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[0][2]_i_4_n_0 ),
        .I5(\RAM[0][2]_i_5_n_0 ),
        .O(\RAM[0][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \RAM[0][2]_i_4 
       (.I0(addr_a_IBUF[1]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[2]),
        .O(\RAM[0][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \RAM[0][2]_i_5 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .O(\RAM[0][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[1][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[1][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[1][2]_i_3_n_0 ),
        .I4(\RAM_reg[1] [0]),
        .O(\RAM[1][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[1][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[1][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[1][2]_i_3_n_0 ),
        .I4(\RAM_reg[1] [1]),
        .O(\RAM[1][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[1][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[1][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[1][2]_i_3_n_0 ),
        .I4(\RAM_reg[1] [2]),
        .O(\RAM[1][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101010101000FF10)) 
    \RAM[1][2]_i_2 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[0]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[1][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[1][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[1][2]_i_4_n_0 ),
        .I5(\RAM[1][2]_i_5_n_0 ),
        .O(\RAM[1][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \RAM[1][2]_i_4 
       (.I0(addr_a_IBUF[1]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[2]),
        .O(\RAM[1][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \RAM[1][2]_i_5 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[1][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[2][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[2][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[2][2]_i_3_n_0 ),
        .I4(\RAM_reg[2] [0]),
        .O(\RAM[2][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[2][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[2][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[2][2]_i_3_n_0 ),
        .I4(\RAM_reg[2] [1]),
        .O(\RAM[2][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[2][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[2][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[2][2]_i_3_n_0 ),
        .I4(\RAM_reg[2] [2]),
        .O(\RAM[2][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h040404040400FF04)) 
    \RAM[2][2]_i_2 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[2][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[2][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[2][2]_i_4_n_0 ),
        .I5(\RAM[2][2]_i_5_n_0 ),
        .O(\RAM[2][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \RAM[2][2]_i_4 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[2][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \RAM[2][2]_i_5 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[2][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[3][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[3][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[3][2]_i_3_n_0 ),
        .I4(\RAM_reg[3] [0]),
        .O(\RAM[3][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[3][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[3][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[3][2]_i_3_n_0 ),
        .I4(\RAM_reg[3] [1]),
        .O(\RAM[3][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[3][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[3][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[3][2]_i_3_n_0 ),
        .I4(\RAM_reg[3] [2]),
        .O(\RAM[3][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h404040404000FF40)) 
    \RAM[3][2]_i_2 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[3][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[3][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[3][2]_i_4_n_0 ),
        .I5(\RAM[3][2]_i_5_n_0 ),
        .O(\RAM[3][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \RAM[3][2]_i_4 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[3][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \RAM[3][2]_i_5 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[3][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[4][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[4][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[4][2]_i_3_n_0 ),
        .I4(\RAM_reg[4] [0]),
        .O(\RAM[4][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[4][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[4][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[4][2]_i_3_n_0 ),
        .I4(\RAM_reg[4] [1]),
        .O(\RAM[4][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[4][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[4][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[4][2]_i_3_n_0 ),
        .I4(\RAM_reg[4] [2]),
        .O(\RAM[4][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h040404040400FF04)) 
    \RAM[4][2]_i_2 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[1]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[4][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[4][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[4][2]_i_4_n_0 ),
        .I5(\RAM[4][2]_i_5_n_0 ),
        .O(\RAM[4][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \RAM[4][2]_i_4 
       (.I0(addr_a_IBUF[1]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[0]),
        .O(\RAM[4][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \RAM[4][2]_i_5 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[1]),
        .O(\RAM[4][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[5][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[5][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[5][2]_i_3_n_0 ),
        .I4(\RAM_reg[5] [0]),
        .O(\RAM[5][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[5][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[5][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[5][2]_i_3_n_0 ),
        .I4(\RAM_reg[5] [1]),
        .O(\RAM[5][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[5][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[5][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[5][2]_i_3_n_0 ),
        .I4(\RAM_reg[5] [2]),
        .O(\RAM[5][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h202020202000FF20)) 
    \RAM[5][2]_i_2 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[5][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[5][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[5][2]_i_4_n_0 ),
        .I5(\RAM[5][2]_i_5_n_0 ),
        .O(\RAM[5][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \RAM[5][2]_i_4 
       (.I0(addr_a_IBUF[1]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[2]),
        .O(\RAM[5][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \RAM[5][2]_i_5 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[5][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[6][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[6][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[6][2]_i_3_n_0 ),
        .I4(\RAM_reg[6] [0]),
        .O(\RAM[6][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[6][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[6][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[6][2]_i_3_n_0 ),
        .I4(\RAM_reg[6] [1]),
        .O(\RAM[6][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[6][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[6][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[6][2]_i_3_n_0 ),
        .I4(\RAM_reg[6] [2]),
        .O(\RAM[6][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h202020202000FF20)) 
    \RAM[6][2]_i_2 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[0]),
        .I2(addr_b_IBUF[2]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .I5(error_i_2_n_0),
        .O(\RAM[6][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000101011001110)) 
    \RAM[6][2]_i_3 
       (.I0(rst_IBUF),
        .I1(error_i_2_n_0),
        .I2(we_a_IBUF),
        .I3(we_b_IBUF),
        .I4(\RAM[6][2]_i_4_n_0 ),
        .I5(\RAM[6][2]_i_5_n_0 ),
        .O(\RAM[6][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \RAM[6][2]_i_4 
       (.I0(addr_a_IBUF[2]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[6][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \RAM[6][2]_i_5 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[0]),
        .I2(addr_b_IBUF[2]),
        .O(\RAM[6][2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[7][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[7][2]_i_2_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(\RAM[7][2]_i_3_n_0 ),
        .I4(\RAM_reg[7] [0]),
        .O(\RAM[7][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[7][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[7][2]_i_2_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(\RAM[7][2]_i_3_n_0 ),
        .I4(\RAM_reg[7] [1]),
        .O(\RAM[7][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \RAM[7][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[7][2]_i_2_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(\RAM[7][2]_i_3_n_0 ),
        .I4(\RAM_reg[7] [2]),
        .O(\RAM[7][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8080800080FF8080)) 
    \RAM[7][2]_i_2 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .I3(error_i_2_n_0),
        .I4(we_b_IBUF),
        .I5(we_a_IBUF),
        .O(\RAM[7][2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000F080808)) 
    \RAM[7][2]_i_3 
       (.I0(\RAM[7][2]_i_4_n_0 ),
        .I1(we_a_IBUF),
        .I2(error_i_2_n_0),
        .I3(we_b_IBUF),
        .I4(\RAM[7][2]_i_5_n_0 ),
        .I5(rst_IBUF),
        .O(\RAM[7][2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \RAM[7][2]_i_4 
       (.I0(addr_a_IBUF[1]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[2]),
        .O(\RAM[7][2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \RAM[7][2]_i_5 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[7][2]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[0][0]_i_1_n_0 ),
        .Q(\RAM_reg[0] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[0][1]_i_1_n_0 ),
        .Q(\RAM_reg[0] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[0][2]_i_1_n_0 ),
        .Q(\RAM_reg[0] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[1][0]_i_1_n_0 ),
        .Q(\RAM_reg[1] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[1][1]_i_1_n_0 ),
        .Q(\RAM_reg[1] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[1][2]_i_1_n_0 ),
        .Q(\RAM_reg[1] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[2][0]_i_1_n_0 ),
        .Q(\RAM_reg[2] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[2][1]_i_1_n_0 ),
        .Q(\RAM_reg[2] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[2][2]_i_1_n_0 ),
        .Q(\RAM_reg[2] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[3][0]_i_1_n_0 ),
        .Q(\RAM_reg[3] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[3][1]_i_1_n_0 ),
        .Q(\RAM_reg[3] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[3][2]_i_1_n_0 ),
        .Q(\RAM_reg[3] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[4][0]_i_1_n_0 ),
        .Q(\RAM_reg[4] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[4][1]_i_1_n_0 ),
        .Q(\RAM_reg[4] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[4][2]_i_1_n_0 ),
        .Q(\RAM_reg[4] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[5][0]_i_1_n_0 ),
        .Q(\RAM_reg[5] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[5][1]_i_1_n_0 ),
        .Q(\RAM_reg[5] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[5][2]_i_1_n_0 ),
        .Q(\RAM_reg[5] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[6][0]_i_1_n_0 ),
        .Q(\RAM_reg[6] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[6][1]_i_1_n_0 ),
        .Q(\RAM_reg[6] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[6][2]_i_1_n_0 ),
        .Q(\RAM_reg[6] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[7][0]_i_1_n_0 ),
        .Q(\RAM_reg[7] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[7][1]_i_1_n_0 ),
        .Q(\RAM_reg[7] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\RAM[7][2]_i_1_n_0 ),
        .Q(\RAM_reg[7] [2]),
        .R(rst_IBUF));
  LUT6 #(
    .INIT(64'h3033333332333033)) 
    \display[0]_i_1 
       (.I0(\display[6]_i_3_n_0 ),
        .I1(\display[0]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\display[6]_i_4_n_0 ),
        .I5(\display[6]_i_5_n_0 ),
        .O(\count_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h004C000000C00000)) 
    \display[0]_i_2 
       (.I0(\addr_b[2]_0 ),
        .I1(\display_reg[0] ),
        .I2(\addr_b[2]_1 ),
        .I3(we_b_IBUF),
        .I4(oe_b_IBUF),
        .I5(\addr_b[2] ),
        .O(\display[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hABABAAABAAABAAAA)) 
    \display[1]_i_1 
       (.I0(\display[1]_i_2_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\display[4]_i_4_n_0 ),
        .I4(\display[1]_i_3_n_0 ),
        .I5(\display[4]_i_3_n_0 ),
        .O(\count_reg[1] ));
  LUT6 #(
    .INIT(64'h0000C40000004000)) 
    \display[1]_i_2 
       (.I0(\display_reg[1]_i_4_n_0 ),
        .I1(\display_reg[4] ),
        .I2(\display_reg[1]_i_5_n_0 ),
        .I3(oe_a_IBUF),
        .I4(we_a_IBUF),
        .I5(\display_reg[4]_i_11_n_0 ),
        .O(\display[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \display[1]_i_3 
       (.I0(\addr_b[2] ),
        .I1(we_b_IBUF),
        .I2(oe_b_IBUF),
        .O(\display[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hD0FFFFFFD0D0D0D0)) 
    \display[2]_i_1 
       (.I0(\display[2]_i_2_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(\display_reg[4] ),
        .I3(\addr_b[2] ),
        .I4(\display[4]_i_4_n_0 ),
        .I5(\display_reg[2] ),
        .O(\count_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF47FF)) 
    \display[2]_i_2 
       (.I0(\display[6]_i_14_n_0 ),
        .I1(addr_a_IBUF[2]),
        .I2(\display[6]_i_13_n_0 ),
        .I3(oe_a_IBUF),
        .I4(we_a_IBUF),
        .I5(\display_reg[4]_i_11_n_0 ),
        .O(\display[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[2]_i_5 
       (.I0(\RAM_reg[3] [1]),
        .I1(\RAM_reg[2] [1]),
        .I2(addr_b_IBUF[1]),
        .I3(\RAM_reg[1] [1]),
        .I4(addr_b_IBUF[0]),
        .I5(\RAM_reg[0] [1]),
        .O(\display[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[2]_i_6 
       (.I0(\RAM_reg[7] [1]),
        .I1(\RAM_reg[6] [1]),
        .I2(addr_b_IBUF[1]),
        .I3(\RAM_reg[5] [1]),
        .I4(addr_b_IBUF[0]),
        .I5(\RAM_reg[4] [1]),
        .O(\display[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00610000)) 
    \display[3]_i_1 
       (.I0(\display[6]_i_5_n_0 ),
        .I1(\display[6]_i_4_n_0 ),
        .I2(\display[6]_i_3_n_0 ),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(\display[3]_i_2_n_0 ),
        .O(\count_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h0900020000000000)) 
    \display[3]_i_2 
       (.I0(\addr_b[2]_1 ),
        .I1(\addr_b[2] ),
        .I2(we_b_IBUF),
        .I3(oe_b_IBUF),
        .I4(\addr_b[2]_0 ),
        .I5(\display_reg[0] ),
        .O(\display[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4040404040FF4040)) 
    \display[4]_i_1 
       (.I0(\display_reg[4]_0 ),
        .I1(\display[4]_i_3_n_0 ),
        .I2(\display[4]_i_4_n_0 ),
        .I3(\display[6]_i_3_n_0 ),
        .I4(\display_reg[4] ),
        .I5(\display[4]_i_6_n_0 ),
        .O(\count_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[4]_i_10 
       (.I0(\RAM_reg[7] [0]),
        .I1(\RAM_reg[6] [0]),
        .I2(addr_b_IBUF[1]),
        .I3(\RAM_reg[5] [0]),
        .I4(addr_b_IBUF[0]),
        .I5(\RAM_reg[4] [0]),
        .O(\display[4]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hDFDDDFFF)) 
    \display[4]_i_3 
       (.I0(oe_b_IBUF),
        .I1(we_b_IBUF),
        .I2(\display[4]_i_7_n_0 ),
        .I3(addr_b_IBUF[2]),
        .I4(\display[4]_i_8_n_0 ),
        .O(\display[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \display[4]_i_4 
       (.I0(we_b_IBUF),
        .I1(oe_b_IBUF),
        .I2(\display[4]_i_9_n_0 ),
        .I3(addr_b_IBUF[2]),
        .I4(\display[4]_i_10_n_0 ),
        .O(\display[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFB8FFFFFFFFFF)) 
    \display[4]_i_6 
       (.I0(\display[6]_i_14_n_0 ),
        .I1(addr_a_IBUF[2]),
        .I2(\display[6]_i_13_n_0 ),
        .I3(oe_a_IBUF),
        .I4(we_a_IBUF),
        .I5(\display_reg[4]_i_11_n_0 ),
        .O(\display[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[4]_i_7 
       (.I0(\RAM_reg[7] [2]),
        .I1(\RAM_reg[6] [2]),
        .I2(addr_b_IBUF[1]),
        .I3(\RAM_reg[5] [2]),
        .I4(addr_b_IBUF[0]),
        .I5(\RAM_reg[4] [2]),
        .O(\display[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[4]_i_8 
       (.I0(\RAM_reg[3] [2]),
        .I1(\RAM_reg[2] [2]),
        .I2(addr_b_IBUF[1]),
        .I3(\RAM_reg[1] [2]),
        .I4(addr_b_IBUF[0]),
        .I5(\RAM_reg[0] [2]),
        .O(\display[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[4]_i_9 
       (.I0(\RAM_reg[3] [0]),
        .I1(\RAM_reg[2] [0]),
        .I2(addr_b_IBUF[1]),
        .I3(\RAM_reg[1] [0]),
        .I4(addr_b_IBUF[0]),
        .I5(\RAM_reg[0] [0]),
        .O(\display[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00060000)) 
    \display[5]_i_1 
       (.I0(\display[6]_i_4_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(\display[6]_i_5_n_0 ),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(\display[5]_i_2_n_0 ),
        .O(\count_reg[0] ));
  LUT6 #(
    .INIT(64'h0000080000008000)) 
    \display[5]_i_2 
       (.I0(\addr_b[2]_1 ),
        .I1(\display_reg[0] ),
        .I2(\addr_b[2]_0 ),
        .I3(oe_b_IBUF),
        .I4(we_b_IBUF),
        .I5(\addr_b[2] ),
        .O(\display[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAEABAAAAAAAA)) 
    \display[6]_i_1 
       (.I0(\display[6]_i_2_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(\display[6]_i_4_n_0 ),
        .I3(\display[6]_i_5_n_0 ),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\count_reg[0]_2 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_10 
       (.I0(\RAM_reg[7] [0]),
        .I1(\RAM_reg[6] [0]),
        .I2(addr_a_IBUF[1]),
        .I3(\RAM_reg[5] [0]),
        .I4(addr_a_IBUF[0]),
        .I5(\RAM_reg[4] [0]),
        .O(\display[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_11 
       (.I0(\RAM_reg[3] [1]),
        .I1(\RAM_reg[2] [1]),
        .I2(addr_a_IBUF[1]),
        .I3(\RAM_reg[1] [1]),
        .I4(addr_a_IBUF[0]),
        .I5(\RAM_reg[0] [1]),
        .O(\display[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_12 
       (.I0(\RAM_reg[7] [1]),
        .I1(\RAM_reg[6] [1]),
        .I2(addr_a_IBUF[1]),
        .I3(\RAM_reg[5] [1]),
        .I4(addr_a_IBUF[0]),
        .I5(\RAM_reg[4] [1]),
        .O(\display[6]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_13 
       (.I0(\RAM_reg[3] [2]),
        .I1(\RAM_reg[2] [2]),
        .I2(addr_a_IBUF[1]),
        .I3(\RAM_reg[1] [2]),
        .I4(addr_a_IBUF[0]),
        .I5(\RAM_reg[0] [2]),
        .O(\display[6]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_14 
       (.I0(\RAM_reg[7] [2]),
        .I1(\RAM_reg[6] [2]),
        .I2(addr_a_IBUF[1]),
        .I3(\RAM_reg[5] [2]),
        .I4(addr_a_IBUF[0]),
        .I5(\RAM_reg[4] [2]),
        .O(\display[6]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000002800)) 
    \display[6]_i_2 
       (.I0(\display_reg[0] ),
        .I1(\addr_b[2]_1 ),
        .I2(\addr_b[2]_0 ),
        .I3(oe_b_IBUF),
        .I4(we_b_IBUF),
        .I5(\addr_b[2] ),
        .O(\display[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00E20000)) 
    \display[6]_i_3 
       (.I0(\display[6]_i_9_n_0 ),
        .I1(addr_a_IBUF[2]),
        .I2(\display[6]_i_10_n_0 ),
        .I3(we_a_IBUF),
        .I4(oe_a_IBUF),
        .O(\display[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00E20000)) 
    \display[6]_i_4 
       (.I0(\display[6]_i_11_n_0 ),
        .I1(addr_a_IBUF[2]),
        .I2(\display[6]_i_12_n_0 ),
        .I3(we_a_IBUF),
        .I4(oe_a_IBUF),
        .O(\display[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hBBBFFFBF)) 
    \display[6]_i_5 
       (.I0(we_a_IBUF),
        .I1(oe_a_IBUF),
        .I2(\display[6]_i_13_n_0 ),
        .I3(addr_a_IBUF[2]),
        .I4(\display[6]_i_14_n_0 ),
        .O(\display[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_9 
       (.I0(\RAM_reg[3] [0]),
        .I1(\RAM_reg[2] [0]),
        .I2(addr_a_IBUF[1]),
        .I3(\RAM_reg[1] [0]),
        .I4(addr_a_IBUF[0]),
        .I5(\RAM_reg[0] [0]),
        .O(\display[6]_i_9_n_0 ));
  MUXF7 \display_reg[1]_i_4 
       (.I0(\display[6]_i_13_n_0 ),
        .I1(\display[6]_i_14_n_0 ),
        .O(\display_reg[1]_i_4_n_0 ),
        .S(addr_a_IBUF[2]));
  MUXF7 \display_reg[1]_i_5 
       (.I0(\display[6]_i_9_n_0 ),
        .I1(\display[6]_i_10_n_0 ),
        .O(\display_reg[1]_i_5_n_0 ),
        .S(addr_a_IBUF[2]));
  MUXF7 \display_reg[2]_i_3 
       (.I0(\display[2]_i_5_n_0 ),
        .I1(\display[2]_i_6_n_0 ),
        .O(\addr_b[2] ),
        .S(addr_b_IBUF[2]));
  MUXF7 \display_reg[4]_i_11 
       (.I0(\display[6]_i_11_n_0 ),
        .I1(\display[6]_i_12_n_0 ),
        .O(\display_reg[4]_i_11_n_0 ),
        .S(addr_a_IBUF[2]));
  MUXF7 \display_reg[6]_i_7 
       (.I0(\display[4]_i_8_n_0 ),
        .I1(\display[4]_i_7_n_0 ),
        .O(\addr_b[2]_1 ),
        .S(addr_b_IBUF[2]));
  MUXF7 \display_reg[6]_i_8 
       (.I0(\display[4]_i_9_n_0 ),
        .I1(\display[4]_i_10_n_0 ),
        .O(\addr_b[2]_0 ),
        .S(addr_b_IBUF[2]));
  LUT4 #(
    .INIT(16'hFF57)) 
    error_i_1
       (.I0(error_i_2_n_0),
        .I1(we_b_IBUF),
        .I2(we_a_IBUF),
        .I3(rst_IBUF),
        .O(error_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    error_i_2
       (.I0(addr_a_IBUF[1]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_b_IBUF[0]),
        .I5(addr_a_IBUF[0]),
        .O(error_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    error_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(1'b1),
        .Q(error_OBUF),
        .R(error_i_1_n_0));
endmodule

module display7seg
   (Q,
    \count_reg[1]_0 ,
    \count_reg[1]_1 ,
    \count_reg[1]_2 ,
    \count_reg[0]_0 ,
    \an_reg[3]_0 ,
    display_OBUF,
    oe_b_IBUF,
    we_b_IBUF,
    \display_reg[4]_0 ,
    \display_reg[2]_0 ,
    \display_reg[2]_1 ,
    CLK,
    \display_reg[6]_0 ,
    \display_reg[5]_0 ,
    \display_reg[4]_1 ,
    \display_reg[3]_0 ,
    \display_reg[2]_2 ,
    \display_reg[1]_0 ,
    \display_reg[0]_0 );
  output [1:0]Q;
  output \count_reg[1]_0 ;
  output \count_reg[1]_1 ;
  output \count_reg[1]_2 ;
  output \count_reg[0]_0 ;
  output [3:0]\an_reg[3]_0 ;
  output [6:0]display_OBUF;
  input oe_b_IBUF;
  input we_b_IBUF;
  input \display_reg[4]_0 ;
  input \display_reg[2]_0 ;
  input \display_reg[2]_1 ;
  input CLK;
  input \display_reg[6]_0 ;
  input \display_reg[5]_0 ;
  input \display_reg[4]_1 ;
  input \display_reg[3]_0 ;
  input \display_reg[2]_2 ;
  input \display_reg[1]_0 ;
  input \display_reg[0]_0 ;

  wire CLK;
  wire [1:0]Q;
  wire \an[0]_i_1_n_0 ;
  wire \an[1]_i_1_n_0 ;
  wire \an[2]_i_1_n_0 ;
  wire \an[3]_i_1_n_0 ;
  wire [3:0]\an_reg[3]_0 ;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count_reg[0]_0 ;
  wire \count_reg[1]_0 ;
  wire \count_reg[1]_1 ;
  wire \count_reg[1]_2 ;
  wire [6:0]display_OBUF;
  wire \display_reg[0]_0 ;
  wire \display_reg[1]_0 ;
  wire \display_reg[2]_0 ;
  wire \display_reg[2]_1 ;
  wire \display_reg[2]_2 ;
  wire \display_reg[3]_0 ;
  wire \display_reg[4]_0 ;
  wire \display_reg[4]_1 ;
  wire \display_reg[5]_0 ;
  wire \display_reg[6]_0 ;
  wire oe_b_IBUF;
  wire we_b_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\an[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\an[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\an[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \an[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\an[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\an[0]_i_1_n_0 ),
        .Q(\an_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\an[1]_i_1_n_0 ),
        .Q(\an_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\an[2]_i_1_n_0 ),
        .Q(\an_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\an[3]_i_1_n_0 ),
        .Q(\an_reg[3]_0 [3]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(Q[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000110000001000)) 
    \display[2]_i_4 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\display_reg[2]_0 ),
        .I3(oe_b_IBUF),
        .I4(we_b_IBUF),
        .I5(\display_reg[2]_1 ),
        .O(\count_reg[1]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \display[4]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(oe_b_IBUF),
        .I3(we_b_IBUF),
        .I4(\display_reg[4]_0 ),
        .O(\count_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \display[4]_i_5 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\count_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \display[6]_i_6 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[0]_0 ),
        .Q(display_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[1]_0 ),
        .Q(display_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[2]_2 ),
        .Q(display_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[3]_0 ),
        .Q(display_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[4]_1 ),
        .Q(display_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[5]_0 ),
        .Q(display_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\display_reg[6]_0 ),
        .Q(display_OBUF[6]),
        .R(1'b0));
endmodule

module divider
   (CLK,
    clk_IBUF_BUFG,
    rst_IBUF);
  output CLK;
  input clk_IBUF_BUFG;
  input rst_IBUF;

  wire CLK;
  wire clk_IBUF_BUFG;
  wire clk_div_i_1_n_0;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire \counter[0]_i_5_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[0]_i_7_n_0 ;
  wire [15:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire rst_IBUF;
  wire [3:3]\NLW_counter_reg[12]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h00000000AAAAAA9A)) 
    clk_div_i_1
       (.I0(CLK),
        .I1(\counter[0]_i_6_n_0 ),
        .I2(\counter[0]_i_5_n_0 ),
        .I3(\counter[0]_i_4_n_0 ),
        .I4(\counter[0]_i_3_n_0 ),
        .I5(rst_IBUF),
        .O(clk_div_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_div_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(clk_div_i_1_n_0),
        .Q(CLK),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \counter[0]_i_1 
       (.I0(rst_IBUF),
        .I1(\counter[0]_i_3_n_0 ),
        .I2(\counter[0]_i_4_n_0 ),
        .I3(\counter[0]_i_5_n_0 ),
        .I4(\counter[0]_i_6_n_0 ),
        .O(\counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \counter[0]_i_3 
       (.I0(counter_reg[15]),
        .I1(counter_reg[13]),
        .I2(counter_reg[2]),
        .I3(counter_reg[1]),
        .O(\counter[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \counter[0]_i_4 
       (.I0(counter_reg[11]),
        .I1(counter_reg[3]),
        .I2(counter_reg[6]),
        .I3(counter_reg[7]),
        .O(\counter[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \counter[0]_i_5 
       (.I0(counter_reg[12]),
        .I1(counter_reg[9]),
        .I2(counter_reg[5]),
        .I3(counter_reg[0]),
        .O(\counter[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \counter[0]_i_6 
       (.I0(counter_reg[8]),
        .I1(counter_reg[10]),
        .I2(counter_reg[4]),
        .I3(counter_reg[14]),
        .O(\counter[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_7 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\NLW_counter_reg[12]_i_1_CO_UNCONNECTED [3],\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1_n_0 ));
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
endmodule

(* ADDR_DEPTH = "3" *) (* DATA_WIDTH = "3" *) 
(* NotValidForBitStream *)
module top_Asy_DoublePortRAM
   (clk,
    rst,
    addr_a,
    addr_b,
    din_a,
    din_b,
    we_a,
    we_b,
    oe_a,
    oe_b,
    an,
    display,
    error);
  input clk;
  input rst;
  input [2:0]addr_a;
  input [2:0]addr_b;
  input [2:0]din_a;
  input [2:0]din_b;
  input we_a;
  input we_b;
  input oe_a;
  input oe_b;
  output [3:0]an;
  output [6:0]display;
  output error;

  wire S_n_1;
  wire S_n_10;
  wire S_n_2;
  wire S_n_3;
  wire S_n_4;
  wire S_n_5;
  wire S_n_6;
  wire S_n_7;
  wire S_n_8;
  wire S_n_9;
  wire [2:0]addr_a;
  wire [2:0]addr_a_IBUF;
  wire [2:0]addr_b;
  wire [2:0]addr_b_IBUF;
  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [1:0]count;
  wire d_n_0;
  wire [2:0]din_a;
  wire [2:0]din_a_IBUF;
  wire [2:0]din_b;
  wire [2:0]din_b_IBUF;
  wire dis_n_2;
  wire dis_n_3;
  wire dis_n_4;
  wire dis_n_5;
  wire [6:0]display;
  wire [6:0]display_OBUF;
  wire error;
  wire error_OBUF;
  wire oe_a;
  wire oe_a_IBUF;
  wire oe_b;
  wire oe_b_IBUF;
  wire rst;
  wire rst_IBUF;
  wire we_a;
  wire we_a_IBUF;
  wire we_b;
  wire we_b_IBUF;

initial begin
 $sdf_annotate("DoublePortRAM_tb_time_synth.sdf",,,,"tool_control");
end
  Asy_DoublePortRAM S
       (.Q(count),
        .addr_a_IBUF(addr_a_IBUF),
        .\addr_b[2] (S_n_6),
        .\addr_b[2]_0 (S_n_9),
        .\addr_b[2]_1 (S_n_10),
        .addr_b_IBUF(addr_b_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\count_reg[0] (S_n_2),
        .\count_reg[0]_0 (S_n_3),
        .\count_reg[0]_1 (S_n_7),
        .\count_reg[0]_2 (S_n_8),
        .\count_reg[1] (S_n_1),
        .\count_reg[1]_0 (S_n_4),
        .\count_reg[1]_1 (S_n_5),
        .din_a_IBUF(din_a_IBUF),
        .din_b_IBUF(din_b_IBUF),
        .\display_reg[0] (dis_n_5),
        .\display_reg[2] (dis_n_4),
        .\display_reg[4] (dis_n_2),
        .\display_reg[4]_0 (dis_n_3),
        .error_OBUF(error_OBUF),
        .oe_a_IBUF(oe_a_IBUF),
        .oe_b_IBUF(oe_b_IBUF),
        .rst_IBUF(rst_IBUF),
        .we_a_IBUF(we_a_IBUF),
        .we_b_IBUF(we_b_IBUF));
  (* IS_CCIO = "FALSE" *) 
  IBUF \addr_a_IBUF[0]_inst 
       (.I(addr_a[0]),
        .O(addr_a_IBUF[0]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \addr_a_IBUF[1]_inst 
       (.I(addr_a[1]),
        .O(addr_a_IBUF[1]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \addr_a_IBUF[2]_inst 
       (.I(addr_a[2]),
        .O(addr_a_IBUF[2]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \addr_b_IBUF[0]_inst 
       (.I(addr_b[0]),
        .O(addr_b_IBUF[0]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \addr_b_IBUF[1]_inst 
       (.I(addr_b[1]),
        .O(addr_b_IBUF[1]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \addr_b_IBUF[2]_inst 
       (.I(addr_b[2]),
        .O(addr_b_IBUF[2]));
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  (* IS_CCIO = "FALSE" *) 
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  divider d
       (.CLK(d_n_0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_IBUF(rst_IBUF));
  (* IS_CCIO = "FALSE" *) 
  IBUF \din_a_IBUF[0]_inst 
       (.I(din_a[0]),
        .O(din_a_IBUF[0]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \din_a_IBUF[1]_inst 
       (.I(din_a[1]),
        .O(din_a_IBUF[1]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \din_a_IBUF[2]_inst 
       (.I(din_a[2]),
        .O(din_a_IBUF[2]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \din_b_IBUF[0]_inst 
       (.I(din_b[0]),
        .O(din_b_IBUF[0]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \din_b_IBUF[1]_inst 
       (.I(din_b[1]),
        .O(din_b_IBUF[1]));
  (* IS_CCIO = "FALSE" *) 
  IBUF \din_b_IBUF[2]_inst 
       (.I(din_b[2]),
        .O(din_b_IBUF[2]));
  display7seg dis
       (.CLK(d_n_0),
        .Q(count),
        .\an_reg[3]_0 (an_OBUF),
        .\count_reg[0]_0 (dis_n_5),
        .\count_reg[1]_0 (dis_n_2),
        .\count_reg[1]_1 (dis_n_3),
        .\count_reg[1]_2 (dis_n_4),
        .display_OBUF(display_OBUF),
        .\display_reg[0]_0 (S_n_3),
        .\display_reg[1]_0 (S_n_1),
        .\display_reg[2]_0 (S_n_9),
        .\display_reg[2]_1 (S_n_10),
        .\display_reg[2]_2 (S_n_5),
        .\display_reg[3]_0 (S_n_7),
        .\display_reg[4]_0 (S_n_6),
        .\display_reg[4]_1 (S_n_4),
        .\display_reg[5]_0 (S_n_2),
        .\display_reg[6]_0 (S_n_8),
        .oe_b_IBUF(oe_b_IBUF),
        .we_b_IBUF(we_b_IBUF));
  OBUF \display_OBUF[0]_inst 
       (.I(display_OBUF[0]),
        .O(display[0]));
  OBUF \display_OBUF[1]_inst 
       (.I(display_OBUF[1]),
        .O(display[1]));
  OBUF \display_OBUF[2]_inst 
       (.I(display_OBUF[2]),
        .O(display[2]));
  OBUF \display_OBUF[3]_inst 
       (.I(display_OBUF[3]),
        .O(display[3]));
  OBUF \display_OBUF[4]_inst 
       (.I(display_OBUF[4]),
        .O(display[4]));
  OBUF \display_OBUF[5]_inst 
       (.I(display_OBUF[5]),
        .O(display[5]));
  OBUF \display_OBUF[6]_inst 
       (.I(display_OBUF[6]),
        .O(display[6]));
  OBUF error_OBUF_inst
       (.I(error_OBUF),
        .O(error));
  (* IS_CCIO = "FALSE" *) 
  IBUF oe_a_IBUF_inst
       (.I(oe_a),
        .O(oe_a_IBUF));
  (* IS_CCIO = "FALSE" *) 
  IBUF oe_b_IBUF_inst
       (.I(oe_b),
        .O(oe_b_IBUF));
  (* IS_CCIO = "FALSE" *) 
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  (* IS_CCIO = "FALSE" *) 
  IBUF we_a_IBUF_inst
       (.I(we_a),
        .O(we_a_IBUF));
  (* IS_CCIO = "FALSE" *) 
  IBUF we_b_IBUF_inst
       (.I(we_b),
        .O(we_b_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
