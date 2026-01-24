// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Oct 23 15:31:23 2021
// Host        : LAPTOP-2P04PJLI running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/CODES/vivado/Project3-1/Project3-1.sim/sim_1/synth/timing/xsim/design_1_sim_time_synth.v
// Design      : design_1_wrapper
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* HW_HANDOFF = "design_1.hwdef" *) 
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

  wire S1;
  wire S2;
  wire a;
  wire andgate_0_c;
  wire andgate_1_c;
  wire andgate_2_c;
  wire andgate_3_c;
  wire andgate_4_c;
  wire andgate_5_c;
  wire andgate_6_c;
  wire andgate_7_c;
  wire b;
  wire c;
  wire d;
  wire [0:0]e;
  wire notgate_0_b;
  wire notgate_1_b;
  wire orgate_0_c;
  wire orgate_1_c;

  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_0_0 andgate_0
       (.a(a),
        .b(andgate_1_c),
        .c(andgate_0_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_1_0 andgate_1
       (.a(notgate_1_b),
        .b(notgate_0_b),
        .c(andgate_1_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_1_1 andgate_2
       (.a(S1),
        .b(notgate_0_b),
        .c(andgate_2_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_0_1 andgate_3
       (.a(andgate_2_c),
        .b(b),
        .c(andgate_3_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_0_2 andgate_4
       (.a(andgate_6_c),
        .b(c),
        .c(andgate_4_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_0_3 andgate_5
       (.a(andgate_7_c),
        .b(d),
        .c(andgate_5_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_2_0 andgate_6
       (.a(S2),
        .b(notgate_1_b),
        .c(andgate_6_c));
  (* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
  design_1_andgate_2_1 andgate_7
       (.a(S1),
        .b(S2),
        .c(andgate_7_c));
  (* X_CORE_INFO = "notgate,Vivado 2018.3" *) 
  design_1_notgate_0_0 notgate_0
       (.a(S2),
        .b(notgate_0_b));
  (* X_CORE_INFO = "notgate,Vivado 2018.3" *) 
  design_1_notgate_1_0 notgate_1
       (.a(S1),
        .b(notgate_1_b));
  (* X_CORE_INFO = "orgate,Vivado 2018.3" *) 
  design_1_orgate_0_0 orgate_0
       (.a(andgate_0_c),
        .b(andgate_3_c),
        .c(orgate_0_c));
  (* X_CORE_INFO = "orgate,Vivado 2018.3" *) 
  design_1_orgate_1_0 orgate_1
       (.a(andgate_4_c),
        .b(andgate_5_c),
        .c(orgate_1_c));
  (* X_CORE_INFO = "orgate,Vivado 2018.3" *) 
  design_1_orgate_2_0 orgate_2
       (.a(orgate_0_c),
        .b(orgate_1_c),
        .c(e));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_0_0
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_0_1
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_0_2
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_0_3
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_1_0
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_1_1
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_2_0
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_andgate_0_0,andgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "andgate,Vivado 2018.3" *) 
module design_1_andgate_2_1
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'h8)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_notgate_1_0,notgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "notgate,Vivado 2018.3" *) 
module design_1_notgate_0_0
   (a,
    b);
  input [0:0]a;
  output [0:0]b;

  wire [0:0]a;
  wire [0:0]b;

  LUT1 #(
    .INIT(2'h1)) 
    \b[0]_INST_0 
       (.I0(a),
        .O(b));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_notgate_1_0,notgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "notgate,Vivado 2018.3" *) 
module design_1_notgate_1_0
   (a,
    b);
  input [0:0]a;
  output [0:0]b;

  wire [0:0]a;
  wire [0:0]b;

  LUT1 #(
    .INIT(2'h1)) 
    \b[0]_INST_0 
       (.I0(a),
        .O(b));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_orgate_0_0,orgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "orgate,Vivado 2018.3" *) 
module design_1_orgate_0_0
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'hE)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_orgate_0_0,orgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "orgate,Vivado 2018.3" *) 
module design_1_orgate_1_0
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'hE)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_orgate_0_0,orgate,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "orgate,Vivado 2018.3" *) 
module design_1_orgate_2_0
   (a,
    b,
    c);
  input [0:0]a;
  input [0:0]b;
  output [0:0]c;

  wire [0:0]a;
  wire [0:0]b;
  wire [0:0]c;

  LUT2 #(
    .INIT(4'hE)) 
    \c[0]_INST_0 
       (.I0(a),
        .I1(b),
        .O(c));
endmodule

(* NotValidForBitStream *)
module design_1_wrapper
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

  wire S1;
  wire S1_IBUF;
  wire S2;
  wire S2_IBUF;
  wire a;
  wire a_IBUF;
  wire b;
  wire b_IBUF;
  wire c;
  wire c_IBUF;
  wire d;
  wire d_IBUF;
  wire [0:0]e;
  wire [0:0]e_OBUF;

initial begin
 $sdf_annotate("design_1_sim_time_synth.sdf",,,,"tool_control");
end
  IBUF S1_IBUF_inst
       (.I(S1),
        .O(S1_IBUF));
  IBUF S2_IBUF_inst
       (.I(S2),
        .O(S2_IBUF));
  IBUF a_IBUF_inst
       (.I(a),
        .O(a_IBUF));
  IBUF b_IBUF_inst
       (.I(b),
        .O(b_IBUF));
  IBUF c_IBUF_inst
       (.I(c),
        .O(c_IBUF));
  IBUF d_IBUF_inst
       (.I(d),
        .O(d_IBUF));
  (* HW_HANDOFF = "design_1.hwdef" *) 
  design_1 design_1_i
       (.S1(S1_IBUF),
        .S2(S2_IBUF),
        .a(a_IBUF),
        .b(b_IBUF),
        .c(c_IBUF),
        .d(d_IBUF),
        .e(e_OBUF));
  OBUF \e_OBUF[0]_inst 
       (.I(e_OBUF),
        .O(e));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
