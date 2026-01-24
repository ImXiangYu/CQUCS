//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Thu Nov 24 14:52:16 2022
//Host        : Unicx running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (S1,
    S2,
    a,
    b,
    c,
    d,
    e);
  input S1;
  input S2;
  input a;
  input b;
  input c;
  input d;
  output [0:0]e;

  wire S1_1;
  wire S2_1;
  wire a_1;
  wire [0:0]andgate_0_c;
  wire [0:0]andgate_1_c;
  wire [0:0]andgate_2_c;
  wire [0:0]andgate_3_c;
  wire [0:0]andgate_4_c;
  wire [0:0]andgate_5_c;
  wire [0:0]andgate_6_c;
  wire [0:0]andgate_7_c;
  wire b_1;
  wire c_1;
  wire d_1;
  wire [0:0]notgate_0_b;
  wire [0:0]notgate_1_b;
  wire [0:0]orgate_0_c;
  wire [0:0]orgate_1_c;
  wire [0:0]orgate_2_c;

  assign S1_1 = S1;
  assign S2_1 = S2;
  assign a_1 = a;
  assign b_1 = b;
  assign c_1 = c;
  assign d_1 = d;
  assign e[0] = orgate_2_c;
  design_1_andgate_0_0 andgate_0
       (.a(a_1),
        .b(andgate_1_c),
        .c(andgate_0_c));
  design_1_andgate_1_0 andgate_1
       (.a(notgate_1_b),
        .b(notgate_0_b),
        .c(andgate_1_c));
  design_1_andgate_1_1 andgate_2
       (.a(S1_1),
        .b(notgate_0_b),
        .c(andgate_2_c));
  design_1_andgate_0_1 andgate_3
       (.a(andgate_2_c),
        .b(b_1),
        .c(andgate_3_c));
  design_1_andgate_0_2 andgate_4
       (.a(andgate_6_c),
        .b(c_1),
        .c(andgate_4_c));
  design_1_andgate_0_3 andgate_5
       (.a(andgate_7_c),
        .b(d_1),
        .c(andgate_5_c));
  design_1_andgate_2_0 andgate_6
       (.a(S2_1),
        .b(notgate_1_b),
        .c(andgate_6_c));
  design_1_andgate_2_1 andgate_7
       (.a(S1_1),
        .b(S2_1),
        .c(andgate_7_c));
  design_1_notgate_0_0 notgate_0
       (.a(S2_1),
        .b(notgate_0_b));
  design_1_notgate_1_0 notgate_1
       (.a(S1_1),
        .b(notgate_1_b));
  design_1_orgate_0_0 orgate_0
       (.a(andgate_0_c),
        .b(andgate_3_c),
        .c(orgate_0_c));
  design_1_orgate_1_0 orgate_1
       (.a(andgate_4_c),
        .b(andgate_5_c),
        .c(orgate_1_c));
  design_1_orgate_2_0 orgate_2
       (.a(orgate_0_c),
        .b(orgate_1_c),
        .c(orgate_2_c));
endmodule
