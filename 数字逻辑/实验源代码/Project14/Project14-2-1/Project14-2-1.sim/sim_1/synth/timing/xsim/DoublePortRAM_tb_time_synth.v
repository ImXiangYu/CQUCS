// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Nov 25 21:33:45 2022
// Host        : Unicx running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/thatcher/Desktop/Project14-2-1/Project14-2-1.sim/sim_1/synth/timing/xsim/DoublePortRAM_tb_time_synth.v
// Design      : top_Syn_DoublePortRAM
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Syn_DoublePortRAM
   (error_OBUF,
    \count_reg[0] ,
    \count_reg[0]_0 ,
    \count_reg[0]_1 ,
    \count_reg[0]_2 ,
    \dout_a_reg[0]_0 ,
    \count_reg[1] ,
    \dout_b_reg[0]_0 ,
    CLK,
    oe_a_IBUF,
    we_a_IBUF,
    rst_IBUF,
    we_b_IBUF,
    addr_b_IBUF,
    addr_a_IBUF,
    oe_b_IBUF,
    din_a_IBUF,
    din_b_IBUF,
    Q);
  output error_OBUF;
  output \count_reg[0] ;
  output \count_reg[0]_0 ;
  output \count_reg[0]_1 ;
  output \count_reg[0]_2 ;
  output \dout_a_reg[0]_0 ;
  output \count_reg[1] ;
  output \dout_b_reg[0]_0 ;
  input CLK;
  input oe_a_IBUF;
  input we_a_IBUF;
  input rst_IBUF;
  input we_b_IBUF;
  input [2:0]addr_b_IBUF;
  input [2:0]addr_a_IBUF;
  input oe_b_IBUF;
  input [3:0]din_a_IBUF;
  input [3:0]din_b_IBUF;
  input [1:0]Q;

  wire CLK;
  wire [1:0]Q;
  wire [3:0]RAM;
  wire \RAM[0][0]_i_1_n_0 ;
  wire \RAM[0][1]_i_1_n_0 ;
  wire \RAM[0][2]_i_1_n_0 ;
  wire \RAM[0][3]_i_1_n_0 ;
  wire \RAM[0][3]_i_2_n_0 ;
  wire \RAM[0][3]_i_3_n_0 ;
  wire \RAM[0][3]_i_4_n_0 ;
  wire \RAM[1][0]_i_1_n_0 ;
  wire \RAM[1][1]_i_1_n_0 ;
  wire \RAM[1][2]_i_1_n_0 ;
  wire \RAM[1][3]_i_1_n_0 ;
  wire \RAM[1][3]_i_2_n_0 ;
  wire \RAM[1][3]_i_3_n_0 ;
  wire \RAM[1][3]_i_4_n_0 ;
  wire \RAM[2][0]_i_1_n_0 ;
  wire \RAM[2][1]_i_1_n_0 ;
  wire \RAM[2][2]_i_1_n_0 ;
  wire \RAM[2][3]_i_1_n_0 ;
  wire \RAM[2][3]_i_2_n_0 ;
  wire \RAM[2][3]_i_3_n_0 ;
  wire \RAM[2][3]_i_4_n_0 ;
  wire \RAM[3][0]_i_1_n_0 ;
  wire \RAM[3][1]_i_1_n_0 ;
  wire \RAM[3][2]_i_1_n_0 ;
  wire \RAM[3][3]_i_1_n_0 ;
  wire \RAM[3][3]_i_2_n_0 ;
  wire \RAM[3][3]_i_3_n_0 ;
  wire \RAM[3][3]_i_4_n_0 ;
  wire \RAM[4][0]_i_1_n_0 ;
  wire \RAM[4][1]_i_1_n_0 ;
  wire \RAM[4][2]_i_1_n_0 ;
  wire \RAM[4][3]_i_1_n_0 ;
  wire \RAM[4][3]_i_2_n_0 ;
  wire \RAM[4][3]_i_3_n_0 ;
  wire \RAM[4][3]_i_4_n_0 ;
  wire \RAM[5][0]_i_1_n_0 ;
  wire \RAM[5][1]_i_1_n_0 ;
  wire \RAM[5][2]_i_1_n_0 ;
  wire \RAM[5][3]_i_1_n_0 ;
  wire \RAM[5][3]_i_2_n_0 ;
  wire \RAM[5][3]_i_3_n_0 ;
  wire \RAM[5][3]_i_4_n_0 ;
  wire \RAM[6][0]_i_1_n_0 ;
  wire \RAM[6][1]_i_1_n_0 ;
  wire \RAM[6][2]_i_1_n_0 ;
  wire \RAM[6][3]_i_1_n_0 ;
  wire \RAM[6][3]_i_2_n_0 ;
  wire \RAM[6][3]_i_3_n_0 ;
  wire \RAM[6][3]_i_4_n_0 ;
  wire \RAM[7][3]_i_1_n_0 ;
  wire \RAM[7][3]_i_3_n_0 ;
  wire \RAM[7][3]_i_5_n_0 ;
  wire [3:0]\RAM_reg[0] ;
  wire [3:0]\RAM_reg[1] ;
  wire [3:0]\RAM_reg[2] ;
  wire [3:0]\RAM_reg[3] ;
  wire [3:0]\RAM_reg[4] ;
  wire [3:0]\RAM_reg[5] ;
  wire [3:0]\RAM_reg[6] ;
  wire [3:0]\RAM_reg[7] ;
  wire [2:0]addr_a_IBUF;
  wire [2:0]addr_b_IBUF;
  wire \count_reg[0] ;
  wire \count_reg[0]_0 ;
  wire \count_reg[0]_1 ;
  wire \count_reg[0]_2 ;
  wire \count_reg[1] ;
  wire [3:0]din_a_IBUF;
  wire [3:0]din_b_IBUF;
  wire \display[0]_i_2_n_0 ;
  wire \display[1]_i_2_n_0 ;
  wire \display[1]_i_3_n_0 ;
  wire \display[2]_i_2_n_0 ;
  wire \display[2]_i_3_n_0 ;
  wire \display[3]_i_2_n_0 ;
  wire \display[3]_i_3_n_0 ;
  wire \display[4]_i_2_n_0 ;
  wire \display[4]_i_3_n_0 ;
  wire \display[5]_i_2_n_0 ;
  wire \display[5]_i_3_n_0 ;
  wire \display[6]_i_2_n_0 ;
  wire \display[6]_i_3_n_0 ;
  wire \display[6]_i_4_n_0 ;
  wire \display[6]_i_5_n_0 ;
  wire [3:0]dout_a;
  wire \dout_a[0]_i_2_n_0 ;
  wire \dout_a[0]_i_3_n_0 ;
  wire \dout_a[0]_i_4_n_0 ;
  wire \dout_a[0]_i_5_n_0 ;
  wire \dout_a[1]_i_2_n_0 ;
  wire \dout_a[1]_i_3_n_0 ;
  wire \dout_a[1]_i_4_n_0 ;
  wire \dout_a[1]_i_5_n_0 ;
  wire \dout_a[2]_i_2_n_0 ;
  wire \dout_a[2]_i_3_n_0 ;
  wire \dout_a[2]_i_4_n_0 ;
  wire \dout_a[2]_i_5_n_0 ;
  wire \dout_a[3]_i_1_n_0 ;
  wire \dout_a[3]_i_3_n_0 ;
  wire \dout_a[3]_i_4_n_0 ;
  wire \dout_a[3]_i_5_n_0 ;
  wire \dout_a[3]_i_6_n_0 ;
  wire \dout_a_reg[0]_0 ;
  wire [3:0]dout_b;
  wire \dout_b[0]_i_1_n_0 ;
  wire \dout_b[0]_i_2_n_0 ;
  wire \dout_b[0]_i_3_n_0 ;
  wire \dout_b[0]_i_4_n_0 ;
  wire \dout_b[0]_i_5_n_0 ;
  wire \dout_b[1]_i_1_n_0 ;
  wire \dout_b[1]_i_2_n_0 ;
  wire \dout_b[1]_i_3_n_0 ;
  wire \dout_b[1]_i_4_n_0 ;
  wire \dout_b[1]_i_5_n_0 ;
  wire \dout_b[2]_i_1_n_0 ;
  wire \dout_b[2]_i_2_n_0 ;
  wire \dout_b[2]_i_3_n_0 ;
  wire \dout_b[2]_i_4_n_0 ;
  wire \dout_b[2]_i_5_n_0 ;
  wire \dout_b[3]_i_1_n_0 ;
  wire \dout_b[3]_i_2_n_0 ;
  wire \dout_b[3]_i_3_n_0 ;
  wire \dout_b[3]_i_4_n_0 ;
  wire \dout_b[3]_i_5_n_0 ;
  wire \dout_b[3]_i_6_n_0 ;
  wire \dout_b_reg[0]_0 ;
  wire error0__4;
  wire error_OBUF;
  wire error_i_1_n_0;
  wire error_i_2_n_0;
  wire error_i_3_n_0;
  wire error_i_4_n_0;
  wire oe_a_IBUF;
  wire oe_b_IBUF;
  wire [3:0]p_0_in;
  wire rst_IBUF;
  wire we_a_IBUF;
  wire we_b_IBUF;

  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[0][0]_i_1 
       (.I0(din_a_IBUF[0]),
        .I1(\RAM[0][3]_i_3_n_0 ),
        .I2(din_b_IBUF[0]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[0][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[0][1]_i_1 
       (.I0(din_a_IBUF[1]),
        .I1(\RAM[0][3]_i_3_n_0 ),
        .I2(din_b_IBUF[1]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[0][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[0][2]_i_1 
       (.I0(din_a_IBUF[2]),
        .I1(\RAM[0][3]_i_3_n_0 ),
        .I2(din_b_IBUF[2]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[0][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8008800)) 
    \RAM[0][3]_i_1 
       (.I0(\RAM[0][3]_i_3_n_0 ),
        .I1(we_b_IBUF),
        .I2(we_a_IBUF),
        .I3(error0__4),
        .I4(\RAM[0][3]_i_4_n_0 ),
        .O(\RAM[0][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[0][3]_i_2 
       (.I0(din_a_IBUF[3]),
        .I1(\RAM[0][3]_i_3_n_0 ),
        .I2(din_b_IBUF[3]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[0][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \RAM[0][3]_i_3 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[0]),
        .I2(addr_b_IBUF[2]),
        .O(\RAM[0][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \RAM[0][3]_i_4 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[0][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[1][0]_i_1 
       (.I0(din_a_IBUF[0]),
        .I1(\RAM[1][3]_i_4_n_0 ),
        .I2(din_b_IBUF[0]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[1][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[1][1]_i_1 
       (.I0(din_a_IBUF[1]),
        .I1(\RAM[1][3]_i_4_n_0 ),
        .I2(din_b_IBUF[1]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[1][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[1][2]_i_1 
       (.I0(din_a_IBUF[2]),
        .I1(\RAM[1][3]_i_4_n_0 ),
        .I2(din_b_IBUF[2]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[1][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEAC00000)) 
    \RAM[1][3]_i_1 
       (.I0(\RAM[1][3]_i_3_n_0 ),
        .I1(\RAM[1][3]_i_4_n_0 ),
        .I2(we_b_IBUF),
        .I3(we_a_IBUF),
        .I4(error0__4),
        .O(\RAM[1][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[1][3]_i_2 
       (.I0(din_a_IBUF[3]),
        .I1(\RAM[1][3]_i_4_n_0 ),
        .I2(din_b_IBUF[3]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[1][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \RAM[1][3]_i_3 
       (.I0(addr_a_IBUF[2]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[1][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \RAM[1][3]_i_4 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_b_IBUF[0]),
        .I2(addr_b_IBUF[1]),
        .O(\RAM[1][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[2][0]_i_1 
       (.I0(din_a_IBUF[0]),
        .I1(\RAM[2][3]_i_4_n_0 ),
        .I2(din_b_IBUF[0]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[2][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[2][1]_i_1 
       (.I0(din_a_IBUF[1]),
        .I1(\RAM[2][3]_i_4_n_0 ),
        .I2(din_b_IBUF[1]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[2][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[2][2]_i_1 
       (.I0(din_a_IBUF[2]),
        .I1(\RAM[2][3]_i_4_n_0 ),
        .I2(din_b_IBUF[2]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[2][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEAC00000)) 
    \RAM[2][3]_i_1 
       (.I0(\RAM[2][3]_i_3_n_0 ),
        .I1(\RAM[2][3]_i_4_n_0 ),
        .I2(we_b_IBUF),
        .I3(we_a_IBUF),
        .I4(error0__4),
        .O(\RAM[2][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[2][3]_i_2 
       (.I0(din_a_IBUF[3]),
        .I1(\RAM[2][3]_i_4_n_0 ),
        .I2(din_b_IBUF[3]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[2][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \RAM[2][3]_i_3 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[2][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \RAM[2][3]_i_4 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[2][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[3][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(\RAM[3][3]_i_4_n_0 ),
        .I2(din_a_IBUF[0]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .O(\RAM[3][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[3][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(\RAM[3][3]_i_4_n_0 ),
        .I2(din_a_IBUF[1]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .O(\RAM[3][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[3][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(\RAM[3][3]_i_4_n_0 ),
        .I2(din_a_IBUF[2]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .O(\RAM[3][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBA300000)) 
    \RAM[3][3]_i_1 
       (.I0(\RAM[3][3]_i_3_n_0 ),
        .I1(\RAM[3][3]_i_4_n_0 ),
        .I2(we_b_IBUF),
        .I3(we_a_IBUF),
        .I4(error0__4),
        .O(\RAM[3][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[3][3]_i_2 
       (.I0(din_b_IBUF[3]),
        .I1(\RAM[3][3]_i_4_n_0 ),
        .I2(din_a_IBUF[3]),
        .I3(we_b_IBUF),
        .I4(we_a_IBUF),
        .O(\RAM[3][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \RAM[3][3]_i_3 
       (.I0(addr_a_IBUF[2]),
        .I1(addr_a_IBUF[0]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[3][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \RAM[3][3]_i_4 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[0]),
        .O(\RAM[3][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[4][0]_i_1 
       (.I0(din_a_IBUF[0]),
        .I1(\RAM[4][3]_i_3_n_0 ),
        .I2(din_b_IBUF[0]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[4][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[4][1]_i_1 
       (.I0(din_a_IBUF[1]),
        .I1(\RAM[4][3]_i_3_n_0 ),
        .I2(din_b_IBUF[1]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[4][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[4][2]_i_1 
       (.I0(din_a_IBUF[2]),
        .I1(\RAM[4][3]_i_3_n_0 ),
        .I2(din_b_IBUF[2]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[4][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8008800)) 
    \RAM[4][3]_i_1 
       (.I0(\RAM[4][3]_i_3_n_0 ),
        .I1(we_b_IBUF),
        .I2(we_a_IBUF),
        .I3(error0__4),
        .I4(\RAM[4][3]_i_4_n_0 ),
        .O(\RAM[4][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[4][3]_i_2 
       (.I0(din_a_IBUF[3]),
        .I1(\RAM[4][3]_i_3_n_0 ),
        .I2(din_b_IBUF[3]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[4][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \RAM[4][3]_i_3 
       (.I0(addr_b_IBUF[1]),
        .I1(addr_b_IBUF[0]),
        .I2(addr_b_IBUF[2]),
        .O(\RAM[4][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \RAM[4][3]_i_4 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[4][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[5][0]_i_1 
       (.I0(din_a_IBUF[0]),
        .I1(\RAM[5][3]_i_3_n_0 ),
        .I2(din_b_IBUF[0]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[5][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[5][1]_i_1 
       (.I0(din_a_IBUF[1]),
        .I1(\RAM[5][3]_i_3_n_0 ),
        .I2(din_b_IBUF[1]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[5][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[5][2]_i_1 
       (.I0(din_a_IBUF[2]),
        .I1(\RAM[5][3]_i_3_n_0 ),
        .I2(din_b_IBUF[2]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[5][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8008800)) 
    \RAM[5][3]_i_1 
       (.I0(\RAM[5][3]_i_3_n_0 ),
        .I1(we_b_IBUF),
        .I2(we_a_IBUF),
        .I3(error0__4),
        .I4(\RAM[5][3]_i_4_n_0 ),
        .O(\RAM[5][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[5][3]_i_2 
       (.I0(din_a_IBUF[3]),
        .I1(\RAM[5][3]_i_3_n_0 ),
        .I2(din_b_IBUF[3]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[5][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \RAM[5][3]_i_3 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[1]),
        .O(\RAM[5][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \RAM[5][3]_i_4 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[5][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \RAM[6][0]_i_1 
       (.I0(din_b_IBUF[0]),
        .I1(din_a_IBUF[0]),
        .I2(\RAM[6][3]_i_4_n_0 ),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[6][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \RAM[6][1]_i_1 
       (.I0(din_b_IBUF[1]),
        .I1(din_a_IBUF[1]),
        .I2(\RAM[6][3]_i_4_n_0 ),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[6][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \RAM[6][2]_i_1 
       (.I0(din_b_IBUF[2]),
        .I1(din_a_IBUF[2]),
        .I2(\RAM[6][3]_i_4_n_0 ),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[6][2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEAC00000)) 
    \RAM[6][3]_i_1 
       (.I0(\RAM[6][3]_i_3_n_0 ),
        .I1(\RAM[6][3]_i_4_n_0 ),
        .I2(we_b_IBUF),
        .I3(we_a_IBUF),
        .I4(error0__4),
        .O(\RAM[6][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC)) 
    \RAM[6][3]_i_2 
       (.I0(din_b_IBUF[3]),
        .I1(din_a_IBUF[3]),
        .I2(\RAM[6][3]_i_4_n_0 ),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(\RAM[6][3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \RAM[6][3]_i_3 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[6][3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \RAM[6][3]_i_4 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[1]),
        .O(\RAM[6][3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[7][0]_i_1 
       (.I0(din_a_IBUF[0]),
        .I1(\RAM[7][3]_i_3_n_0 ),
        .I2(din_b_IBUF[0]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(p_0_in[0]));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[7][1]_i_1 
       (.I0(din_a_IBUF[1]),
        .I1(\RAM[7][3]_i_3_n_0 ),
        .I2(din_b_IBUF[1]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[7][2]_i_1 
       (.I0(din_a_IBUF[2]),
        .I1(\RAM[7][3]_i_3_n_0 ),
        .I2(din_b_IBUF[2]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(p_0_in[2]));
  LUT5 #(
    .INIT(32'hF8008800)) 
    \RAM[7][3]_i_1 
       (.I0(\RAM[7][3]_i_3_n_0 ),
        .I1(we_b_IBUF),
        .I2(we_a_IBUF),
        .I3(error0__4),
        .I4(\RAM[7][3]_i_5_n_0 ),
        .O(\RAM[7][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2F0AAE2)) 
    \RAM[7][3]_i_2 
       (.I0(din_a_IBUF[3]),
        .I1(\RAM[7][3]_i_3_n_0 ),
        .I2(din_b_IBUF[3]),
        .I3(we_a_IBUF),
        .I4(we_b_IBUF),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \RAM[7][3]_i_3 
       (.I0(addr_b_IBUF[0]),
        .I1(addr_b_IBUF[2]),
        .I2(addr_b_IBUF[1]),
        .O(\RAM[7][3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \RAM[7][3]_i_4 
       (.I0(addr_b_IBUF[2]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_a_IBUF[1]),
        .I4(addr_a_IBUF[0]),
        .I5(addr_b_IBUF[0]),
        .O(error0__4));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \RAM[7][3]_i_5 
       (.I0(addr_a_IBUF[0]),
        .I1(addr_a_IBUF[2]),
        .I2(addr_a_IBUF[1]),
        .O(\RAM[7][3]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][0] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(\RAM[0][0]_i_1_n_0 ),
        .Q(\RAM_reg[0] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][1] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(\RAM[0][1]_i_1_n_0 ),
        .Q(\RAM_reg[0] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][2] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(\RAM[0][2]_i_1_n_0 ),
        .Q(\RAM_reg[0] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][3] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(\RAM[0][3]_i_2_n_0 ),
        .Q(\RAM_reg[0] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][0] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(\RAM[1][0]_i_1_n_0 ),
        .Q(\RAM_reg[1] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][1] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(\RAM[1][1]_i_1_n_0 ),
        .Q(\RAM_reg[1] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][2] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(\RAM[1][2]_i_1_n_0 ),
        .Q(\RAM_reg[1] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][3] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(\RAM[1][3]_i_2_n_0 ),
        .Q(\RAM_reg[1] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][0] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(\RAM[2][0]_i_1_n_0 ),
        .Q(\RAM_reg[2] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][1] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(\RAM[2][1]_i_1_n_0 ),
        .Q(\RAM_reg[2] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][2] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(\RAM[2][2]_i_1_n_0 ),
        .Q(\RAM_reg[2] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][3] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(\RAM[2][3]_i_2_n_0 ),
        .Q(\RAM_reg[2] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][0] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(\RAM[3][0]_i_1_n_0 ),
        .Q(\RAM_reg[3] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][1] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(\RAM[3][1]_i_1_n_0 ),
        .Q(\RAM_reg[3] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][2] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(\RAM[3][2]_i_1_n_0 ),
        .Q(\RAM_reg[3] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][3] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(\RAM[3][3]_i_2_n_0 ),
        .Q(\RAM_reg[3] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][0] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(\RAM[4][0]_i_1_n_0 ),
        .Q(\RAM_reg[4] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][1] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(\RAM[4][1]_i_1_n_0 ),
        .Q(\RAM_reg[4] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][2] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(\RAM[4][2]_i_1_n_0 ),
        .Q(\RAM_reg[4] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][3] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(\RAM[4][3]_i_2_n_0 ),
        .Q(\RAM_reg[4] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][0] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(\RAM[5][0]_i_1_n_0 ),
        .Q(\RAM_reg[5] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][1] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(\RAM[5][1]_i_1_n_0 ),
        .Q(\RAM_reg[5] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][2] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(\RAM[5][2]_i_1_n_0 ),
        .Q(\RAM_reg[5] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][3] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(\RAM[5][3]_i_2_n_0 ),
        .Q(\RAM_reg[5] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][0] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(\RAM[6][0]_i_1_n_0 ),
        .Q(\RAM_reg[6] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][1] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(\RAM[6][1]_i_1_n_0 ),
        .Q(\RAM_reg[6] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][2] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(\RAM[6][2]_i_1_n_0 ),
        .Q(\RAM_reg[6] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][3] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(\RAM[6][3]_i_2_n_0 ),
        .Q(\RAM_reg[6] [3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][0] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(\RAM_reg[7] [0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][1] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(\RAM_reg[7] [1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][2] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(\RAM_reg[7] [2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][3] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(\RAM_reg[7] [3]),
        .R(rst_IBUF));
  LUT6 #(
    .INIT(64'h20C3FFFF20C30000)) 
    \display[0]_i_1 
       (.I0(dout_a[0]),
        .I1(dout_a[3]),
        .I2(dout_a[1]),
        .I3(dout_a[2]),
        .I4(Q[1]),
        .I5(\display[0]_i_2_n_0 ),
        .O(\dout_a_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h20C3)) 
    \display[0]_i_2 
       (.I0(dout_b[0]),
        .I1(dout_b[3]),
        .I2(dout_b[1]),
        .I3(dout_b[2]),
        .O(\display[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[1]_i_1 
       (.I0(\display[6]_i_2_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(\display[1]_i_2_n_0 ),
        .I4(Q[1]),
        .I5(\display[1]_i_3_n_0 ),
        .O(\count_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h2CB2)) 
    \display[1]_i_2 
       (.I0(dout_a[0]),
        .I1(dout_a[2]),
        .I2(dout_a[1]),
        .I3(dout_a[3]),
        .O(\display[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2CB2)) 
    \display[1]_i_3 
       (.I0(dout_b[0]),
        .I1(dout_b[3]),
        .I2(dout_b[1]),
        .I3(dout_b[2]),
        .O(\display[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[2]_i_1 
       (.I0(\display[6]_i_2_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(\display[2]_i_2_n_0 ),
        .I4(Q[1]),
        .I5(\display[2]_i_3_n_0 ),
        .O(\count_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFF82)) 
    \display[2]_i_2 
       (.I0(dout_a[2]),
        .I1(dout_a[1]),
        .I2(dout_a[3]),
        .I3(dout_a[0]),
        .O(\display[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hFF84)) 
    \display[2]_i_3 
       (.I0(dout_b[1]),
        .I1(dout_b[2]),
        .I2(dout_b[3]),
        .I3(dout_b[0]),
        .O(\display[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[3]_i_1 
       (.I0(\display[6]_i_2_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(\display[3]_i_2_n_0 ),
        .I4(Q[1]),
        .I5(\display[3]_i_3_n_0 ),
        .O(\count_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6182)) 
    \display[3]_i_2 
       (.I0(dout_a[0]),
        .I1(dout_a[3]),
        .I2(dout_a[1]),
        .I3(dout_a[2]),
        .O(\display[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h6812)) 
    \display[3]_i_3 
       (.I0(dout_b[0]),
        .I1(dout_b[3]),
        .I2(dout_b[2]),
        .I3(dout_b[1]),
        .O(\display[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004F40404)) 
    \display[4]_i_1 
       (.I0(dout_b[0]),
        .I1(\display[4]_i_2_n_0 ),
        .I2(Q[1]),
        .I3(dout_a[0]),
        .I4(\display[4]_i_3_n_0 ),
        .I5(Q[0]),
        .O(\dout_b_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h24)) 
    \display[4]_i_2 
       (.I0(dout_b[3]),
        .I1(dout_b[1]),
        .I2(dout_b[2]),
        .O(\display[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h24)) 
    \display[4]_i_3 
       (.I0(dout_a[2]),
        .I1(dout_a[1]),
        .I2(dout_a[3]),
        .O(\display[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \display[5]_i_1 
       (.I0(\display[5]_i_2_n_0 ),
        .I1(Q[1]),
        .I2(\display[5]_i_3_n_0 ),
        .I3(Q[0]),
        .O(\count_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h8048)) 
    \display[5]_i_2 
       (.I0(dout_b[0]),
        .I1(dout_b[2]),
        .I2(dout_b[1]),
        .I3(dout_b[3]),
        .O(\display[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h9200)) 
    \display[5]_i_3 
       (.I0(dout_a[0]),
        .I1(dout_a[3]),
        .I2(dout_a[1]),
        .I3(dout_a[2]),
        .O(\display[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[6]_i_1 
       (.I0(\display[6]_i_2_n_0 ),
        .I1(\display[6]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(\display[6]_i_4_n_0 ),
        .I4(Q[1]),
        .I5(\display[6]_i_5_n_0 ),
        .O(\count_reg[0]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    \display[6]_i_2 
       (.I0(dout_a[2]),
        .I1(dout_a[3]),
        .I2(dout_a[1]),
        .O(\display[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hE0)) 
    \display[6]_i_3 
       (.I0(dout_b[1]),
        .I1(dout_b[2]),
        .I2(dout_b[3]),
        .O(\display[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h4182)) 
    \display[6]_i_4 
       (.I0(dout_a[0]),
        .I1(dout_a[3]),
        .I2(dout_a[1]),
        .I3(dout_a[2]),
        .O(\display[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h4812)) 
    \display[6]_i_5 
       (.I0(dout_b[0]),
        .I1(dout_b[3]),
        .I2(dout_b[2]),
        .I3(dout_b[1]),
        .O(\display[6]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_a[0]_i_1 
       (.I0(\dout_a[0]_i_2_n_0 ),
        .I1(\dout_a[0]_i_3_n_0 ),
        .I2(\dout_a[0]_i_4_n_0 ),
        .I3(\dout_a[0]_i_5_n_0 ),
        .O(RAM[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_a[0]_i_2 
       (.I0(\RAM_reg[5] [0]),
        .I1(\RAM_reg[1] [0]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hAC000000)) 
    \dout_a[0]_i_3 
       (.I0(\RAM_reg[7] [0]),
        .I1(\RAM_reg[3] [0]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000A0C)) 
    \dout_a[0]_i_4 
       (.I0(\RAM_reg[4] [0]),
        .I1(\RAM_reg[0] [0]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0A0C0000)) 
    \dout_a[0]_i_5 
       (.I0(\RAM_reg[6] [0]),
        .I1(\RAM_reg[2] [0]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_a[1]_i_1 
       (.I0(\dout_a[1]_i_2_n_0 ),
        .I1(\dout_a[1]_i_3_n_0 ),
        .I2(\dout_a[1]_i_4_n_0 ),
        .I3(\dout_a[1]_i_5_n_0 ),
        .O(RAM[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_a[1]_i_2 
       (.I0(\RAM_reg[5] [1]),
        .I1(\RAM_reg[1] [1]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAC000000)) 
    \dout_a[1]_i_3 
       (.I0(\RAM_reg[7] [1]),
        .I1(\RAM_reg[3] [1]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000A0C)) 
    \dout_a[1]_i_4 
       (.I0(\RAM_reg[4] [1]),
        .I1(\RAM_reg[0] [1]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0A0C0000)) 
    \dout_a[1]_i_5 
       (.I0(\RAM_reg[6] [1]),
        .I1(\RAM_reg[2] [1]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_a[2]_i_1 
       (.I0(\dout_a[2]_i_2_n_0 ),
        .I1(\dout_a[2]_i_3_n_0 ),
        .I2(\dout_a[2]_i_4_n_0 ),
        .I3(\dout_a[2]_i_5_n_0 ),
        .O(RAM[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_a[2]_i_2 
       (.I0(\RAM_reg[5] [2]),
        .I1(\RAM_reg[1] [2]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAC000000)) 
    \dout_a[2]_i_3 
       (.I0(\RAM_reg[7] [2]),
        .I1(\RAM_reg[3] [2]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000A0C)) 
    \dout_a[2]_i_4 
       (.I0(\RAM_reg[4] [2]),
        .I1(\RAM_reg[0] [2]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0A0C0000)) 
    \dout_a[2]_i_5 
       (.I0(\RAM_reg[6] [2]),
        .I1(\RAM_reg[2] [2]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \dout_a[3]_i_1 
       (.I0(oe_a_IBUF),
        .I1(we_a_IBUF),
        .I2(rst_IBUF),
        .O(\dout_a[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_a[3]_i_2 
       (.I0(\dout_a[3]_i_3_n_0 ),
        .I1(\dout_a[3]_i_4_n_0 ),
        .I2(\dout_a[3]_i_5_n_0 ),
        .I3(\dout_a[3]_i_6_n_0 ),
        .O(RAM[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_a[3]_i_3 
       (.I0(\RAM_reg[5] [3]),
        .I1(\RAM_reg[1] [3]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hAC000000)) 
    \dout_a[3]_i_4 
       (.I0(\RAM_reg[7] [3]),
        .I1(\RAM_reg[3] [3]),
        .I2(addr_a_IBUF[2]),
        .I3(addr_a_IBUF[0]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00000A0C)) 
    \dout_a[3]_i_5 
       (.I0(\RAM_reg[4] [3]),
        .I1(\RAM_reg[0] [3]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0A0C0000)) 
    \dout_a[3]_i_6 
       (.I0(\RAM_reg[6] [3]),
        .I1(\RAM_reg[2] [3]),
        .I2(addr_a_IBUF[0]),
        .I3(addr_a_IBUF[2]),
        .I4(addr_a_IBUF[1]),
        .O(\dout_a[3]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_a_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(RAM[0]),
        .Q(dout_a[0]),
        .R(\dout_a[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_a_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(RAM[1]),
        .Q(dout_a[1]),
        .R(\dout_a[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_a_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(RAM[2]),
        .Q(dout_a[2]),
        .R(\dout_a[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_a_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(RAM[3]),
        .Q(dout_a[3]),
        .R(\dout_a[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_b[0]_i_1 
       (.I0(\dout_b[0]_i_2_n_0 ),
        .I1(\dout_b[0]_i_3_n_0 ),
        .I2(\dout_b[0]_i_4_n_0 ),
        .I3(\dout_b[0]_i_5_n_0 ),
        .O(\dout_b[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_b[0]_i_2 
       (.I0(\RAM_reg[5] [0]),
        .I1(\RAM_reg[1] [0]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[1]),
        .O(\dout_b[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h8C008000)) 
    \dout_b[0]_i_3 
       (.I0(\RAM_reg[7] [0]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(\RAM_reg[3] [0]),
        .O(\dout_b[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h000A000C)) 
    \dout_b[0]_i_4 
       (.I0(\RAM_reg[4] [0]),
        .I1(\RAM_reg[0] [0]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[2]),
        .O(\dout_b[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000A0C0)) 
    \dout_b[0]_i_5 
       (.I0(\RAM_reg[6] [0]),
        .I1(\RAM_reg[2] [0]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[2]),
        .I4(addr_b_IBUF[0]),
        .O(\dout_b[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_b[1]_i_1 
       (.I0(\dout_b[1]_i_2_n_0 ),
        .I1(\dout_b[1]_i_3_n_0 ),
        .I2(\dout_b[1]_i_4_n_0 ),
        .I3(\dout_b[1]_i_5_n_0 ),
        .O(\dout_b[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_b[1]_i_2 
       (.I0(\RAM_reg[5] [1]),
        .I1(\RAM_reg[1] [1]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[1]),
        .O(\dout_b[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h8C008000)) 
    \dout_b[1]_i_3 
       (.I0(\RAM_reg[7] [1]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(\RAM_reg[3] [1]),
        .O(\dout_b[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h000A000C)) 
    \dout_b[1]_i_4 
       (.I0(\RAM_reg[4] [1]),
        .I1(\RAM_reg[0] [1]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[2]),
        .O(\dout_b[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000A0C0)) 
    \dout_b[1]_i_5 
       (.I0(\RAM_reg[6] [1]),
        .I1(\RAM_reg[2] [1]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[2]),
        .I4(addr_b_IBUF[0]),
        .O(\dout_b[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_b[2]_i_1 
       (.I0(\dout_b[2]_i_2_n_0 ),
        .I1(\dout_b[2]_i_3_n_0 ),
        .I2(\dout_b[2]_i_4_n_0 ),
        .I3(\dout_b[2]_i_5_n_0 ),
        .O(\dout_b[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_b[2]_i_2 
       (.I0(\RAM_reg[5] [2]),
        .I1(\RAM_reg[1] [2]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[1]),
        .O(\dout_b[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h8C008000)) 
    \dout_b[2]_i_3 
       (.I0(\RAM_reg[7] [2]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(\RAM_reg[3] [2]),
        .O(\dout_b[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h000A000C)) 
    \dout_b[2]_i_4 
       (.I0(\RAM_reg[4] [2]),
        .I1(\RAM_reg[0] [2]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[2]),
        .O(\dout_b[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000A0C0)) 
    \dout_b[2]_i_5 
       (.I0(\RAM_reg[6] [2]),
        .I1(\RAM_reg[2] [2]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[2]),
        .I4(addr_b_IBUF[0]),
        .O(\dout_b[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \dout_b[3]_i_1 
       (.I0(oe_b_IBUF),
        .I1(we_b_IBUF),
        .I2(rst_IBUF),
        .O(\dout_b[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout_b[3]_i_2 
       (.I0(\dout_b[3]_i_3_n_0 ),
        .I1(\dout_b[3]_i_4_n_0 ),
        .I2(\dout_b[3]_i_5_n_0 ),
        .I3(\dout_b[3]_i_6_n_0 ),
        .O(\dout_b[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \dout_b[3]_i_3 
       (.I0(\RAM_reg[5] [3]),
        .I1(\RAM_reg[1] [3]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[1]),
        .O(\dout_b[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h8C008000)) 
    \dout_b[3]_i_4 
       (.I0(\RAM_reg[7] [3]),
        .I1(addr_b_IBUF[1]),
        .I2(addr_b_IBUF[2]),
        .I3(addr_b_IBUF[0]),
        .I4(\RAM_reg[3] [3]),
        .O(\dout_b[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h000A000C)) 
    \dout_b[3]_i_5 
       (.I0(\RAM_reg[4] [3]),
        .I1(\RAM_reg[0] [3]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[0]),
        .I4(addr_b_IBUF[2]),
        .O(\dout_b[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000A0C0)) 
    \dout_b[3]_i_6 
       (.I0(\RAM_reg[6] [3]),
        .I1(\RAM_reg[2] [3]),
        .I2(addr_b_IBUF[1]),
        .I3(addr_b_IBUF[2]),
        .I4(addr_b_IBUF[0]),
        .O(\dout_b[3]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_b_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout_b[0]_i_1_n_0 ),
        .Q(dout_b[0]),
        .R(\dout_b[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_b_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout_b[1]_i_1_n_0 ),
        .Q(dout_b[1]),
        .R(\dout_b[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_b_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout_b[2]_i_1_n_0 ),
        .Q(dout_b[2]),
        .R(\dout_b[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dout_b_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\dout_b[3]_i_2_n_0 ),
        .Q(dout_b[3]),
        .R(\dout_b[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFAB)) 
    error_i_1
       (.I0(rst_IBUF),
        .I1(we_a_IBUF),
        .I2(we_b_IBUF),
        .I3(error_i_2_n_0),
        .I4(error_i_3_n_0),
        .I5(error_i_4_n_0),
        .O(error_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    error_i_2
       (.I0(addr_b_IBUF[1]),
        .I1(addr_a_IBUF[1]),
        .O(error_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    error_i_3
       (.I0(addr_b_IBUF[2]),
        .I1(addr_a_IBUF[2]),
        .O(error_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    error_i_4
       (.I0(addr_b_IBUF[0]),
        .I1(addr_a_IBUF[0]),
        .O(error_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    error_reg
       (.C(CLK),
        .CE(1'b1),
        .D(1'b1),
        .Q(error_OBUF),
        .R(error_i_1_n_0));
endmodule

module display7seg
   (Q,
    an_OBUF,
    display_OBUF,
    \display_reg[6]_0 ,
    \display_reg[6]_1 ,
    \display_reg[5]_0 ,
    \display_reg[4]_0 ,
    \display_reg[3]_0 ,
    \display_reg[2]_0 ,
    \display_reg[1]_0 ,
    \display_reg[0]_0 );
  output [1:0]Q;
  output [3:0]an_OBUF;
  output [6:0]display_OBUF;
  input \display_reg[6]_0 ;
  input \display_reg[6]_1 ;
  input \display_reg[5]_0 ;
  input \display_reg[4]_0 ;
  input \display_reg[3]_0 ;
  input \display_reg[2]_0 ;
  input \display_reg[1]_0 ;
  input \display_reg[0]_0 ;

  wire [1:0]Q;
  wire \an[2]_i_1_n_0 ;
  wire [3:0]an_OBUF;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire [6:0]display_OBUF;
  wire \display_reg[0]_0 ;
  wire \display_reg[1]_0 ;
  wire \display_reg[2]_0 ;
  wire \display_reg[3]_0 ;
  wire \display_reg[4]_0 ;
  wire \display_reg[5]_0 ;
  wire \display_reg[6]_0 ;
  wire \display_reg[6]_1 ;

  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \an[2]_i_1 
       (.I0(Q[1]),
        .O(\an[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[0] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[1]),
        .Q(an_OBUF[0]),
        .S(Q[0]));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[1] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[1]),
        .Q(an_OBUF[1]),
        .S(\count[0]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[2] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\an[2]_i_1_n_0 ),
        .Q(an_OBUF[2]),
        .S(Q[0]));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[3] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\an[2]_i_1_n_0 ),
        .Q(an_OBUF[3]),
        .S(\count[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(Q[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \display_reg[0] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[0]_0 ),
        .Q(display_OBUF[0]),
        .S(Q[0]));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[1] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[1]_0 ),
        .Q(display_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[2] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[2]_0 ),
        .Q(display_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[3] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[3]_0 ),
        .Q(display_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[4] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[4]_0 ),
        .Q(display_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[5] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[5]_0 ),
        .Q(display_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[6] 
       (.C(\display_reg[6]_0 ),
        .CE(1'b1),
        .D(\display_reg[6]_1 ),
        .Q(display_OBUF[6]),
        .R(1'b0));
endmodule

module divider
   (clk_div_reg_0,
    CLK,
    rst_IBUF);
  output clk_div_reg_0;
  input CLK;
  input rst_IBUF;

  wire CLK;
  wire clk_div_i_1_n_0;
  wire clk_div_reg_0;
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
    .INIT(64'h000000006AAAAAAA)) 
    clk_div_i_1
       (.I0(clk_div_reg_0),
        .I1(\counter[0]_i_6_n_0 ),
        .I2(\counter[0]_i_5_n_0 ),
        .I3(\counter[0]_i_4_n_0 ),
        .I4(\counter[0]_i_3_n_0 ),
        .I5(rst_IBUF),
        .O(clk_div_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_div_reg
       (.C(CLK),
        .CE(1'b1),
        .D(clk_div_i_1_n_0),
        .Q(clk_div_reg_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    \counter[0]_i_1 
       (.I0(rst_IBUF),
        .I1(\counter[0]_i_3_n_0 ),
        .I2(\counter[0]_i_4_n_0 ),
        .I3(\counter[0]_i_5_n_0 ),
        .I4(\counter[0]_i_6_n_0 ),
        .O(\counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \counter[0]_i_3 
       (.I0(counter_reg[15]),
        .I1(counter_reg[14]),
        .I2(counter_reg[13]),
        .I3(counter_reg[12]),
        .O(\counter[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \counter[0]_i_4 
       (.I0(counter_reg[11]),
        .I1(counter_reg[10]),
        .I2(counter_reg[9]),
        .I3(counter_reg[8]),
        .O(\counter[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \counter[0]_i_5 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[3]),
        .I3(counter_reg[2]),
        .O(\counter[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \counter[0]_i_6 
       (.I0(counter_reg[7]),
        .I1(counter_reg[6]),
        .I2(counter_reg[5]),
        .I3(counter_reg[4]),
        .O(\counter[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_7 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
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
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
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
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
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
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
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
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
endmodule

(* ADDR_DEPTH = "3" *) (* DATA_WIDTH = "4" *) 
(* NotValidForBitStream *)
module top_Syn_DoublePortRAM
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
  input [3:0]din_a;
  input [3:0]din_b;
  input we_a;
  input we_b;
  input oe_a;
  input oe_b;
  output [3:0]an;
  output [6:0]display;
  output error;

  wire S_n_1;
  wire S_n_2;
  wire S_n_3;
  wire S_n_4;
  wire S_n_5;
  wire S_n_6;
  wire S_n_7;
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
  wire [3:0]din_a;
  wire [3:0]din_a_IBUF;
  wire [3:0]din_b;
  wire [3:0]din_b_IBUF;
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
  Syn_DoublePortRAM S
       (.CLK(clk_IBUF_BUFG),
        .Q(count),
        .addr_a_IBUF(addr_a_IBUF),
        .addr_b_IBUF(addr_b_IBUF),
        .\count_reg[0] (S_n_1),
        .\count_reg[0]_0 (S_n_2),
        .\count_reg[0]_1 (S_n_3),
        .\count_reg[0]_2 (S_n_4),
        .\count_reg[1] (S_n_6),
        .din_a_IBUF(din_a_IBUF),
        .din_b_IBUF(din_b_IBUF),
        .\dout_a_reg[0]_0 (S_n_5),
        .\dout_b_reg[0]_0 (S_n_7),
        .error_OBUF(error_OBUF),
        .oe_a_IBUF(oe_a_IBUF),
        .oe_b_IBUF(oe_b_IBUF),
        .rst_IBUF(rst_IBUF),
        .we_a_IBUF(we_a_IBUF),
        .we_b_IBUF(we_b_IBUF));
  IBUF \addr_a_IBUF[0]_inst 
       (.I(addr_a[0]),
        .O(addr_a_IBUF[0]));
  IBUF \addr_a_IBUF[1]_inst 
       (.I(addr_a[1]),
        .O(addr_a_IBUF[1]));
  IBUF \addr_a_IBUF[2]_inst 
       (.I(addr_a[2]),
        .O(addr_a_IBUF[2]));
  IBUF \addr_b_IBUF[0]_inst 
       (.I(addr_b[0]),
        .O(addr_b_IBUF[0]));
  IBUF \addr_b_IBUF[1]_inst 
       (.I(addr_b[1]),
        .O(addr_b_IBUF[1]));
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
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  divider d
       (.CLK(clk_IBUF_BUFG),
        .clk_div_reg_0(d_n_0),
        .rst_IBUF(rst_IBUF));
  IBUF \din_a_IBUF[0]_inst 
       (.I(din_a[0]),
        .O(din_a_IBUF[0]));
  IBUF \din_a_IBUF[1]_inst 
       (.I(din_a[1]),
        .O(din_a_IBUF[1]));
  IBUF \din_a_IBUF[2]_inst 
       (.I(din_a[2]),
        .O(din_a_IBUF[2]));
  IBUF \din_a_IBUF[3]_inst 
       (.I(din_a[3]),
        .O(din_a_IBUF[3]));
  IBUF \din_b_IBUF[0]_inst 
       (.I(din_b[0]),
        .O(din_b_IBUF[0]));
  IBUF \din_b_IBUF[1]_inst 
       (.I(din_b[1]),
        .O(din_b_IBUF[1]));
  IBUF \din_b_IBUF[2]_inst 
       (.I(din_b[2]),
        .O(din_b_IBUF[2]));
  IBUF \din_b_IBUF[3]_inst 
       (.I(din_b[3]),
        .O(din_b_IBUF[3]));
  display7seg dis
       (.Q(count),
        .an_OBUF(an_OBUF),
        .display_OBUF(display_OBUF),
        .\display_reg[0]_0 (S_n_5),
        .\display_reg[1]_0 (S_n_1),
        .\display_reg[2]_0 (S_n_2),
        .\display_reg[3]_0 (S_n_3),
        .\display_reg[4]_0 (S_n_7),
        .\display_reg[5]_0 (S_n_6),
        .\display_reg[6]_0 (d_n_0),
        .\display_reg[6]_1 (S_n_4));
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
  IBUF oe_a_IBUF_inst
       (.I(oe_a),
        .O(oe_a_IBUF));
  IBUF oe_b_IBUF_inst
       (.I(oe_b),
        .O(oe_b_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF we_a_IBUF_inst
       (.I(we_a),
        .O(we_a_IBUF));
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
