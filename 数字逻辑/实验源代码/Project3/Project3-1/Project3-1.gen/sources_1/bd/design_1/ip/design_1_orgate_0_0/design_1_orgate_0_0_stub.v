// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Nov 24 14:53:13 2022
// Host        : Unicx running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/thatcher/Desktop/Project3-1/Project3-1.gen/sources_1/bd/design_1/ip/design_1_orgate_0_0/design_1_orgate_0_0_stub.v
// Design      : design_1_orgate_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "orgate,Vivado 2022.1" *)
module design_1_orgate_0_0(a, b, c)
/* synthesis syn_black_box black_box_pad_pin="a[0:0],b[0:0],c[0:0]" */;
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;
endmodule
