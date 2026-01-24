// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Nov 25 21:00:17 2022
// Host        : Unicx running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/thatcher/Desktop/Project14-1-2/Project14-1-2.sim/sim_1/synth/timing/xsim/Asy_SinglePortRAM_tb_time_synth.v
// Design      : top_Asy_SinglePortRAM
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Asy_SinglePortRAM
   (\count_reg[0] ,
    \count_reg[0]_0 ,
    \count_reg[0]_1 ,
    \count_reg[0]_2 ,
    \count_reg[1] ,
    \count_reg[0]_3 ,
    \count_reg[0]_4 ,
    Q,
    we_IBUF,
    addr_IBUF,
    oe_IBUF,
    SR,
    D,
    CLK);
  output \count_reg[0] ;
  output \count_reg[0]_0 ;
  output \count_reg[0]_1 ;
  output \count_reg[0]_2 ;
  output \count_reg[1] ;
  output \count_reg[0]_3 ;
  output \count_reg[0]_4 ;
  input [1:0]Q;
  input we_IBUF;
  input [3:0]addr_IBUF;
  input oe_IBUF;
  input [0:0]SR;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [1:0]Q;
  wire \RAM[0][3]_i_1_n_0 ;
  wire \RAM[10][3]_i_1_n_0 ;
  wire \RAM[11][3]_i_1_n_0 ;
  wire \RAM[12][3]_i_1_n_0 ;
  wire \RAM[13][3]_i_1_n_0 ;
  wire \RAM[14][3]_i_1_n_0 ;
  wire \RAM[15][3]_i_1_n_0 ;
  wire \RAM[1][3]_i_1_n_0 ;
  wire \RAM[2][3]_i_1_n_0 ;
  wire \RAM[3][3]_i_1_n_0 ;
  wire \RAM[4][3]_i_1_n_0 ;
  wire \RAM[5][3]_i_1_n_0 ;
  wire \RAM[6][3]_i_1_n_0 ;
  wire \RAM[7][3]_i_1_n_0 ;
  wire \RAM[8][3]_i_1_n_0 ;
  wire \RAM[9][3]_i_1_n_0 ;
  wire [3:0]\RAM_reg[0] ;
  wire [3:0]\RAM_reg[10] ;
  wire [3:0]\RAM_reg[11] ;
  wire [3:0]\RAM_reg[12] ;
  wire [3:0]\RAM_reg[13] ;
  wire [3:0]\RAM_reg[14] ;
  wire [3:0]\RAM_reg[15] ;
  wire [3:0]\RAM_reg[1] ;
  wire [3:0]\RAM_reg[2] ;
  wire [3:0]\RAM_reg[3] ;
  wire [3:0]\RAM_reg[4] ;
  wire [3:0]\RAM_reg[5] ;
  wire [3:0]\RAM_reg[6] ;
  wire [3:0]\RAM_reg[7] ;
  wire [3:0]\RAM_reg[8] ;
  wire [3:0]\RAM_reg[9] ;
  wire [0:0]SR;
  wire [3:0]addr_IBUF;
  wire \count_reg[0] ;
  wire \count_reg[0]_0 ;
  wire \count_reg[0]_1 ;
  wire \count_reg[0]_2 ;
  wire \count_reg[0]_3 ;
  wire \count_reg[0]_4 ;
  wire \count_reg[1] ;
  wire \display[0]_i_14_n_0 ;
  wire \display[0]_i_15_n_0 ;
  wire \display[0]_i_16_n_0 ;
  wire \display[0]_i_17_n_0 ;
  wire \display[0]_i_18_n_0 ;
  wire \display[0]_i_19_n_0 ;
  wire \display[0]_i_20_n_0 ;
  wire \display[0]_i_21_n_0 ;
  wire \display[0]_i_22_n_0 ;
  wire \display[0]_i_23_n_0 ;
  wire \display[0]_i_24_n_0 ;
  wire \display[0]_i_25_n_0 ;
  wire \display[0]_i_26_n_0 ;
  wire \display[0]_i_27_n_0 ;
  wire \display[0]_i_28_n_0 ;
  wire \display[0]_i_29_n_0 ;
  wire \display[0]_i_2_n_0 ;
  wire \display[0]_i_3_n_0 ;
  wire \display[0]_i_4_n_0 ;
  wire \display[0]_i_5_n_0 ;
  wire \display_reg[0]_i_10_n_0 ;
  wire \display_reg[0]_i_11_n_0 ;
  wire \display_reg[0]_i_12_n_0 ;
  wire \display_reg[0]_i_13_n_0 ;
  wire \display_reg[0]_i_6_n_0 ;
  wire \display_reg[0]_i_7_n_0 ;
  wire \display_reg[0]_i_8_n_0 ;
  wire \display_reg[0]_i_9_n_0 ;
  wire oe_IBUF;
  wire we_IBUF;

  LUT5 #(
    .INIT(32'h00000002)) 
    \RAM[0][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[3]),
        .O(\RAM[0][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \RAM[10][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[3]),
        .I2(addr_IBUF[1]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[0]),
        .O(\RAM[10][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \RAM[11][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[3]),
        .O(\RAM[11][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \RAM[12][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[2]),
        .I2(addr_IBUF[3]),
        .I3(addr_IBUF[1]),
        .I4(addr_IBUF[0]),
        .O(\RAM[12][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \RAM[13][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[3]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[1]),
        .I4(addr_IBUF[2]),
        .O(\RAM[13][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \RAM[14][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[3]),
        .I3(addr_IBUF[0]),
        .I4(addr_IBUF[2]),
        .O(\RAM[14][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \RAM[15][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[3]),
        .O(\RAM[15][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    \RAM[1][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[3]),
        .O(\RAM[1][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    \RAM[2][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[0]),
        .I2(addr_IBUF[1]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[3]),
        .O(\RAM[2][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \RAM[3][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[3]),
        .O(\RAM[3][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    \RAM[4][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[2]),
        .I3(addr_IBUF[0]),
        .I4(addr_IBUF[3]),
        .O(\RAM[4][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \RAM[5][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[2]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[1]),
        .I4(addr_IBUF[3]),
        .O(\RAM[5][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \RAM[6][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[2]),
        .I2(addr_IBUF[1]),
        .I3(addr_IBUF[0]),
        .I4(addr_IBUF[3]),
        .O(\RAM[6][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00800000)) 
    \RAM[7][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[3]),
        .I4(addr_IBUF[2]),
        .O(\RAM[7][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    \RAM[8][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[1]),
        .I2(addr_IBUF[3]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[0]),
        .O(\RAM[8][3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    \RAM[9][3]_i_1 
       (.I0(we_IBUF),
        .I1(addr_IBUF[3]),
        .I2(addr_IBUF[0]),
        .I3(addr_IBUF[2]),
        .I4(addr_IBUF[1]),
        .O(\RAM[9][3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][0] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[0] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][1] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[0] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][2] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[0] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[0][3] 
       (.C(CLK),
        .CE(\RAM[0][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[0] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[10][0] 
       (.C(CLK),
        .CE(\RAM[10][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[10] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[10][1] 
       (.C(CLK),
        .CE(\RAM[10][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[10] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[10][2] 
       (.C(CLK),
        .CE(\RAM[10][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[10] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[10][3] 
       (.C(CLK),
        .CE(\RAM[10][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[10] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[11][0] 
       (.C(CLK),
        .CE(\RAM[11][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[11] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[11][1] 
       (.C(CLK),
        .CE(\RAM[11][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[11] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[11][2] 
       (.C(CLK),
        .CE(\RAM[11][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[11] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[11][3] 
       (.C(CLK),
        .CE(\RAM[11][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[11] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[12][0] 
       (.C(CLK),
        .CE(\RAM[12][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[12] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[12][1] 
       (.C(CLK),
        .CE(\RAM[12][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[12] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[12][2] 
       (.C(CLK),
        .CE(\RAM[12][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[12] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[12][3] 
       (.C(CLK),
        .CE(\RAM[12][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[12] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[13][0] 
       (.C(CLK),
        .CE(\RAM[13][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[13] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[13][1] 
       (.C(CLK),
        .CE(\RAM[13][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[13] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[13][2] 
       (.C(CLK),
        .CE(\RAM[13][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[13] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[13][3] 
       (.C(CLK),
        .CE(\RAM[13][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[13] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[14][0] 
       (.C(CLK),
        .CE(\RAM[14][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[14] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[14][1] 
       (.C(CLK),
        .CE(\RAM[14][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[14] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[14][2] 
       (.C(CLK),
        .CE(\RAM[14][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[14] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[14][3] 
       (.C(CLK),
        .CE(\RAM[14][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[14] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[15][0] 
       (.C(CLK),
        .CE(\RAM[15][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[15] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[15][1] 
       (.C(CLK),
        .CE(\RAM[15][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[15] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[15][2] 
       (.C(CLK),
        .CE(\RAM[15][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[15] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[15][3] 
       (.C(CLK),
        .CE(\RAM[15][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[15] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][0] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[1] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][1] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[1] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][2] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[1] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[1][3] 
       (.C(CLK),
        .CE(\RAM[1][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[1] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][0] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[2] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][1] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[2] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][2] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[2] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[2][3] 
       (.C(CLK),
        .CE(\RAM[2][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[2] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][0] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[3] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][1] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[3] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][2] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[3] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[3][3] 
       (.C(CLK),
        .CE(\RAM[3][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[3] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][0] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[4] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][1] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[4] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][2] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[4] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[4][3] 
       (.C(CLK),
        .CE(\RAM[4][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[4] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][0] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[5] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][1] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[5] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][2] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[5] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[5][3] 
       (.C(CLK),
        .CE(\RAM[5][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[5] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][0] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[6] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][1] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[6] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][2] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[6] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[6][3] 
       (.C(CLK),
        .CE(\RAM[6][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[6] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][0] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[7] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][1] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[7] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][2] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[7] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[7][3] 
       (.C(CLK),
        .CE(\RAM[7][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[7] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[8][0] 
       (.C(CLK),
        .CE(\RAM[8][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[8] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[8][1] 
       (.C(CLK),
        .CE(\RAM[8][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[8] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[8][2] 
       (.C(CLK),
        .CE(\RAM[8][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[8] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[8][3] 
       (.C(CLK),
        .CE(\RAM[8][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[8] [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[9][0] 
       (.C(CLK),
        .CE(\RAM[9][3]_i_1_n_0 ),
        .D(D[0]),
        .Q(\RAM_reg[9] [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[9][1] 
       (.C(CLK),
        .CE(\RAM[9][3]_i_1_n_0 ),
        .D(D[1]),
        .Q(\RAM_reg[9] [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[9][2] 
       (.C(CLK),
        .CE(\RAM[9][3]_i_1_n_0 ),
        .D(D[2]),
        .Q(\RAM_reg[9] [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_reg[9][3] 
       (.C(CLK),
        .CE(\RAM[9][3]_i_1_n_0 ),
        .D(D[3]),
        .Q(\RAM_reg[9] [3]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFFAFAAEAAF)) 
    \display[0]_i_1 
       (.I0(Q[1]),
        .I1(\display[0]_i_2_n_0 ),
        .I2(\display[0]_i_3_n_0 ),
        .I3(\display[0]_i_4_n_0 ),
        .I4(\display[0]_i_5_n_0 ),
        .I5(Q[0]),
        .O(\count_reg[1] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_14 
       (.I0(\RAM_reg[3] [0]),
        .I1(\RAM_reg[2] [0]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[1] [0]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[0] [0]),
        .O(\display[0]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_15 
       (.I0(\RAM_reg[7] [0]),
        .I1(\RAM_reg[6] [0]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[5] [0]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[4] [0]),
        .O(\display[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_16 
       (.I0(\RAM_reg[11] [0]),
        .I1(\RAM_reg[10] [0]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[9] [0]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[8] [0]),
        .O(\display[0]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_17 
       (.I0(\RAM_reg[15] [0]),
        .I1(\RAM_reg[14] [0]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[13] [0]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[12] [0]),
        .O(\display[0]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_18 
       (.I0(\RAM_reg[3] [2]),
        .I1(\RAM_reg[2] [2]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[1] [2]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[0] [2]),
        .O(\display[0]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_19 
       (.I0(\RAM_reg[7] [2]),
        .I1(\RAM_reg[6] [2]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[5] [2]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[4] [2]),
        .O(\display[0]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h44400040)) 
    \display[0]_i_2 
       (.I0(we_IBUF),
        .I1(oe_IBUF),
        .I2(\display_reg[0]_i_6_n_0 ),
        .I3(addr_IBUF[3]),
        .I4(\display_reg[0]_i_7_n_0 ),
        .O(\display[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_20 
       (.I0(\RAM_reg[11] [2]),
        .I1(\RAM_reg[10] [2]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[9] [2]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[8] [2]),
        .O(\display[0]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_21 
       (.I0(\RAM_reg[15] [2]),
        .I1(\RAM_reg[14] [2]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[13] [2]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[12] [2]),
        .O(\display[0]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_22 
       (.I0(\RAM_reg[3] [1]),
        .I1(\RAM_reg[2] [1]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[1] [1]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[0] [1]),
        .O(\display[0]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_23 
       (.I0(\RAM_reg[7] [1]),
        .I1(\RAM_reg[6] [1]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[5] [1]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[4] [1]),
        .O(\display[0]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_24 
       (.I0(\RAM_reg[11] [1]),
        .I1(\RAM_reg[10] [1]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[9] [1]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[8] [1]),
        .O(\display[0]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_25 
       (.I0(\RAM_reg[15] [1]),
        .I1(\RAM_reg[14] [1]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[13] [1]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[12] [1]),
        .O(\display[0]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_26 
       (.I0(\RAM_reg[3] [3]),
        .I1(\RAM_reg[2] [3]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[1] [3]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[0] [3]),
        .O(\display[0]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_27 
       (.I0(\RAM_reg[7] [3]),
        .I1(\RAM_reg[6] [3]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[5] [3]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[4] [3]),
        .O(\display[0]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_28 
       (.I0(\RAM_reg[11] [3]),
        .I1(\RAM_reg[10] [3]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[9] [3]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[8] [3]),
        .O(\display[0]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display[0]_i_29 
       (.I0(\RAM_reg[15] [3]),
        .I1(\RAM_reg[14] [3]),
        .I2(addr_IBUF[1]),
        .I3(\RAM_reg[13] [3]),
        .I4(addr_IBUF[0]),
        .I5(\RAM_reg[12] [3]),
        .O(\display[0]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'h44400040)) 
    \display[0]_i_3 
       (.I0(we_IBUF),
        .I1(oe_IBUF),
        .I2(\display_reg[0]_i_8_n_0 ),
        .I3(addr_IBUF[3]),
        .I4(\display_reg[0]_i_9_n_0 ),
        .O(\display[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h44400040)) 
    \display[0]_i_4 
       (.I0(we_IBUF),
        .I1(oe_IBUF),
        .I2(\display_reg[0]_i_10_n_0 ),
        .I3(addr_IBUF[3]),
        .I4(\display_reg[0]_i_11_n_0 ),
        .O(\display[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h44400040)) 
    \display[0]_i_5 
       (.I0(we_IBUF),
        .I1(oe_IBUF),
        .I2(\display_reg[0]_i_12_n_0 ),
        .I3(addr_IBUF[3]),
        .I4(\display_reg[0]_i_13_n_0 ),
        .O(\display[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAEF04504)) 
    \display[1]_i_1 
       (.I0(Q[0]),
        .I1(\display[0]_i_2_n_0 ),
        .I2(\display[0]_i_3_n_0 ),
        .I3(\display[0]_i_4_n_0 ),
        .I4(\display[0]_i_5_n_0 ),
        .O(\count_reg[0]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hDDD5C980)) 
    \display[2]_i_1 
       (.I0(Q[0]),
        .I1(\display[0]_i_5_n_0 ),
        .I2(\display[0]_i_4_n_0 ),
        .I3(\display[0]_i_3_n_0 ),
        .I4(\display[0]_i_2_n_0 ),
        .O(\count_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBEA04014)) 
    \display[3]_i_1 
       (.I0(Q[0]),
        .I1(\display[0]_i_2_n_0 ),
        .I2(\display[0]_i_3_n_0 ),
        .I3(\display[0]_i_4_n_0 ),
        .I4(\display[0]_i_5_n_0 ),
        .O(\count_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000024)) 
    \display[4]_i_1 
       (.I0(\display[0]_i_5_n_0 ),
        .I1(\display[0]_i_4_n_0 ),
        .I2(\display[0]_i_3_n_0 ),
        .I3(\display[0]_i_2_n_0 ),
        .I4(Q[0]),
        .O(\count_reg[0]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00009040)) 
    \display[5]_i_1 
       (.I0(\display[0]_i_5_n_0 ),
        .I1(\display[0]_i_4_n_0 ),
        .I2(\display[0]_i_3_n_0 ),
        .I3(\display[0]_i_2_n_0 ),
        .I4(Q[0]),
        .O(\count_reg[0]_4 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBEA00014)) 
    \display[6]_i_1 
       (.I0(Q[0]),
        .I1(\display[0]_i_2_n_0 ),
        .I2(\display[0]_i_3_n_0 ),
        .I3(\display[0]_i_4_n_0 ),
        .I4(\display[0]_i_5_n_0 ),
        .O(\count_reg[0]_0 ));
  MUXF7 \display_reg[0]_i_10 
       (.I0(\display[0]_i_22_n_0 ),
        .I1(\display[0]_i_23_n_0 ),
        .O(\display_reg[0]_i_10_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_11 
       (.I0(\display[0]_i_24_n_0 ),
        .I1(\display[0]_i_25_n_0 ),
        .O(\display_reg[0]_i_11_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_12 
       (.I0(\display[0]_i_26_n_0 ),
        .I1(\display[0]_i_27_n_0 ),
        .O(\display_reg[0]_i_12_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_13 
       (.I0(\display[0]_i_28_n_0 ),
        .I1(\display[0]_i_29_n_0 ),
        .O(\display_reg[0]_i_13_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_6 
       (.I0(\display[0]_i_14_n_0 ),
        .I1(\display[0]_i_15_n_0 ),
        .O(\display_reg[0]_i_6_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_7 
       (.I0(\display[0]_i_16_n_0 ),
        .I1(\display[0]_i_17_n_0 ),
        .O(\display_reg[0]_i_7_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_8 
       (.I0(\display[0]_i_18_n_0 ),
        .I1(\display[0]_i_19_n_0 ),
        .O(\display_reg[0]_i_8_n_0 ),
        .S(addr_IBUF[2]));
  MUXF7 \display_reg[0]_i_9 
       (.I0(\display[0]_i_20_n_0 ),
        .I1(\display[0]_i_21_n_0 ),
        .O(\display_reg[0]_i_9_n_0 ),
        .S(addr_IBUF[2]));
endmodule

module display7seg
   (Q,
    an_OBUF,
    display_OBUF,
    \display_reg[0]_0 ,
    \display_reg[0]_1 ,
    \display_reg[6]_0 ,
    \display_reg[5]_0 ,
    \display_reg[4]_0 ,
    \display_reg[3]_0 ,
    \display_reg[2]_0 ,
    \display_reg[1]_0 );
  output [1:0]Q;
  output [3:0]an_OBUF;
  output [6:0]display_OBUF;
  input \display_reg[0]_0 ;
  input \display_reg[0]_1 ;
  input \display_reg[6]_0 ;
  input \display_reg[5]_0 ;
  input \display_reg[4]_0 ;
  input \display_reg[3]_0 ;
  input \display_reg[2]_0 ;
  input \display_reg[1]_0 ;

  wire [1:0]Q;
  wire \an[2]_i_1_n_0 ;
  wire \an[3]_i_1_n_0 ;
  wire [3:0]an_OBUF;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire [6:0]display_OBUF;
  wire \display_reg[0]_0 ;
  wire \display_reg[0]_1 ;
  wire \display_reg[1]_0 ;
  wire \display_reg[2]_0 ;
  wire \display_reg[3]_0 ;
  wire \display_reg[4]_0 ;
  wire \display_reg[5]_0 ;
  wire \display_reg[6]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \an[2]_i_1 
       (.I0(Q[1]),
        .O(\an[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \an[3]_i_1 
       (.I0(Q[0]),
        .O(\an[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[0] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(Q[1]),
        .Q(an_OBUF[0]),
        .S(Q[0]));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[1] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(Q[1]),
        .Q(an_OBUF[1]),
        .S(\an[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[2] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\an[2]_i_1_n_0 ),
        .Q(an_OBUF[2]),
        .S(Q[0]));
  FDSE #(
    .INIT(1'b1)) 
    \an_reg[3] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\an[2]_i_1_n_0 ),
        .Q(an_OBUF[3]),
        .S(\an[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(Q[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\count[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[0] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[0]_1 ),
        .Q(display_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[1] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[1]_0 ),
        .Q(display_OBUF[1]),
        .R(Q[1]));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[2] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[2]_0 ),
        .Q(display_OBUF[2]),
        .R(Q[1]));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[3] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[3]_0 ),
        .Q(display_OBUF[3]),
        .R(Q[1]));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[4] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[4]_0 ),
        .Q(display_OBUF[4]),
        .R(Q[1]));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[5] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[5]_0 ),
        .Q(display_OBUF[5]),
        .R(Q[1]));
  FDRE #(
    .INIT(1'b0)) 
    \display_reg[6] 
       (.C(\display_reg[0]_0 ),
        .CE(1'b1),
        .D(\display_reg[6]_0 ),
        .Q(display_OBUF[6]),
        .R(Q[1]));
endmodule

module divider
   (clk_div_reg_0,
    clk,
    SR);
  output clk_div_reg_0;
  input clk;
  input [0:0]SR;

  wire [0:0]SR;
  wire clk;
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
  wire [3:3]\NLW_counter_reg[12]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h000000009AAAAAAA)) 
    clk_div_i_1
       (.I0(clk_div_reg_0),
        .I1(\counter[0]_i_6_n_0 ),
        .I2(\counter[0]_i_5_n_0 ),
        .I3(\counter[0]_i_4_n_0 ),
        .I4(\counter[0]_i_3_n_0 ),
        .I5(SR),
        .O(clk_div_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clk_div_reg
       (.C(clk),
        .CE(1'b1),
        .D(clk_div_i_1_n_0),
        .Q(clk_div_reg_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAAEAAA)) 
    \counter[0]_i_1 
       (.I0(SR),
        .I1(\counter[0]_i_3_n_0 ),
        .I2(\counter[0]_i_4_n_0 ),
        .I3(\counter[0]_i_5_n_0 ),
        .I4(\counter[0]_i_6_n_0 ),
        .O(\counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \counter[0]_i_3 
       (.I0(counter_reg[6]),
        .I1(counter_reg[4]),
        .I2(counter_reg[9]),
        .I3(counter_reg[8]),
        .O(\counter[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \counter[0]_i_4 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[14]),
        .I3(counter_reg[15]),
        .O(\counter[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \counter[0]_i_5 
       (.I0(counter_reg[13]),
        .I1(counter_reg[12]),
        .I2(counter_reg[11]),
        .I3(counter_reg[10]),
        .O(\counter[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[0]_i_6 
       (.I0(counter_reg[3]),
        .I1(counter_reg[2]),
        .I2(counter_reg[7]),
        .I3(counter_reg[5]),
        .O(\counter[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_7 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk),
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
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk),
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
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk),
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
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk),
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
       (.C(clk),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
endmodule

(* ADDR_DEPTH = "4" *) (* DATA_WIDTH = "4" *) 
(* NotValidForBitStream *)
module top_Asy_SinglePortRAM
   (clk,
    rst,
    addr,
    data_in,
    we,
    oe,
    an,
    display);
  input clk;
  input rst;
  input [3:0]addr;
  input [3:0]data_in;
  input we;
  input oe;
  output [3:0]an;
  output [6:0]display;

  wire S_n_0;
  wire S_n_1;
  wire S_n_2;
  wire S_n_3;
  wire S_n_4;
  wire S_n_5;
  wire S_n_6;
  wire [3:0]addr;
  wire [3:0]addr_IBUF;
  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [1:0]count;
  wire d_n_0;
  wire [3:0]data_in;
  wire [3:0]data_in_IBUF;
  wire [6:0]display;
  wire [6:0]display_OBUF;
  wire oe;
  wire oe_IBUF;
  wire rst;
  wire rst_IBUF;
  wire we;
  wire we_IBUF;

initial begin
 $sdf_annotate("Asy_SinglePortRAM_tb_time_synth.sdf",,,,"tool_control");
end
  Asy_SinglePortRAM S
       (.CLK(clk_IBUF_BUFG),
        .D(data_in_IBUF),
        .Q(count),
        .SR(rst_IBUF),
        .addr_IBUF(addr_IBUF),
        .\count_reg[0] (S_n_0),
        .\count_reg[0]_0 (S_n_1),
        .\count_reg[0]_1 (S_n_2),
        .\count_reg[0]_2 (S_n_3),
        .\count_reg[0]_3 (S_n_5),
        .\count_reg[0]_4 (S_n_6),
        .\count_reg[1] (S_n_4),
        .oe_IBUF(oe_IBUF),
        .we_IBUF(we_IBUF));
  IBUF \addr_IBUF[0]_inst 
       (.I(addr[0]),
        .O(addr_IBUF[0]));
  IBUF \addr_IBUF[1]_inst 
       (.I(addr[1]),
        .O(addr_IBUF[1]));
  IBUF \addr_IBUF[2]_inst 
       (.I(addr[2]),
        .O(addr_IBUF[2]));
  IBUF \addr_IBUF[3]_inst 
       (.I(addr[3]),
        .O(addr_IBUF[3]));
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
       (.SR(rst_IBUF),
        .clk(clk_IBUF_BUFG),
        .clk_div_reg_0(d_n_0));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  display7seg dis
       (.Q(count),
        .an_OBUF(an_OBUF),
        .display_OBUF(display_OBUF),
        .\display_reg[0]_0 (d_n_0),
        .\display_reg[0]_1 (S_n_4),
        .\display_reg[1]_0 (S_n_3),
        .\display_reg[2]_0 (S_n_0),
        .\display_reg[3]_0 (S_n_2),
        .\display_reg[4]_0 (S_n_5),
        .\display_reg[5]_0 (S_n_6),
        .\display_reg[6]_0 (S_n_1));
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
  IBUF oe_IBUF_inst
       (.I(oe),
        .O(oe_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF we_IBUF_inst
       (.I(we),
        .O(we_IBUF));
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
