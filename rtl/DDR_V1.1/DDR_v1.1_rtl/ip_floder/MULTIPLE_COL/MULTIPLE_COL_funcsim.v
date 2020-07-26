// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (win64) Build 1034051 Fri Oct  3 17:18:25 MDT 2014
// Date        : Thu Feb 16 18:02:27 2017
// Host        : FL-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               E:/v7_2000/DDR_broad__v1/src/DDR/ip_floder/MULTIPLE_COL/MULTIPLE_COL_funcsim.v
// Design      : MULTIPLE_COL
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7v2000tflg1925-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.3" *) (* CHECK_LICENSE_TYPE = "MULTIPLE_COL,mult_gen_v12_0,{}" *) 
(* core_generation_info = "MULTIPLE_COL,mult_gen_v12_0,{x_ipProduct=Vivado 2014.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=virtex7,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=4,C_A_WIDTH=30,C_A_TYPE=1,C_B_WIDTH=14,C_B_TYPE=1,C_OUT_HIGH=29,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module MULTIPLE_COL
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [29:0]A;
  input [13:0]B;
  output [29:0]P;

  wire [29:0]A;
  wire [13:0]B;
  wire CLK;
  wire [29:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "30" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "14" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "4" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "29" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "virtex7" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MULTIPLE_COL_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "virtex7" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "0" *) (* C_LATENCY = "4" *) (* C_A_WIDTH = "30" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "14" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "29" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module MULTIPLE_COL_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [29:0]A;
  input [13:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [29:0]P;
  output [47:0]PCASC;

  wire [29:0]A;
  wire [13:0]B;
  wire CE;
  wire CLK;
  wire [29:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "30" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "14" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "4" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "29" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "virtex7" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MULTIPLE_COL_mult_gen_v12_0_viv__parameterized0 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
EPdxM3QhbgUN6r8Dgx0n5NBf81Fy0ZBWeZo3Ul/S8oly6CAR1aMUAG3u0HqY/GcYye3r33iDCZGM
zMAJNvvEUA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
MNeexIWnSmsqqVBUWqYuAxFn1Qgpwlhl+uUjsZlepkzjRg+A4F18S/FvjRGgVbyIyv6Z9xHpJa3a
tlIRultIsdXbKfruxy8+PjIVNeLneCp7igD4bmraD6wRcpRC9QZujV5t539qBv/U+hA45lD6NQie
9hZyMey0axlwfdLia3Y=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
qVjFC8ZO/8qo1YHZMnOkJDD0DZWqL4+t/rbLKxncvRJbBjDhoHF4Gw1ihBQRt+h5YQqw5L5232Ep
H8+Dcn6h4TNoBTlOgTlhS47eBIcgJ7e8l7YMYaSr0KIsCFP01BIB6MJ3jwQ8MV0V5kIO5UhXU56U
6VHYQ02kDgWAFWD5ThTnxYK807VmI56AxUAZY5iGzdBWIowqIWh4B4YtQuPVuU3O4upkPiHO+Qk2
R0GsmMEO38DB6pGo4u9p8S6ETs3bQ3EiiatJBzD4tEILiSGduOPXdVRoEf61ZhjQ/uxo2mhqcQlK
EmaGfhML8dP1l75ebPKN5cY1OKpe/taOhWlDsA==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZGvh9vUPHsWNwCKG3TRwMskTk3+hCaHjiqHio21vlP3wCoLJRi1iTTrS/Y0WZWhS3KwhhXZ42XVV
XaHp4U1FmSMk1hVV/Menu4JBOy7kXHLso2bdsfOD//GxhmDvH8TnBk6d/LggoztJdGy/x2CGnkIC
7j2kXohQf/FHKGT8YT8=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OHc/Hnhw5G/Ft4Id460f7HViWwiW2C7RsAsbUFzYNpqrIOr+DMMx6euq02Iz2BQkRa+DxdLbZojE
I3s3is5JFUKOYxcHAml7Cn0nQU1445lBTtvQAUdGtADKIeJDOTvwx7zrC2jKhr/qsDzIP3b5t6TA
pInI+gHlsjH46XiGZIFF1MaIt3qPwnWT6Ydq/AUsryp4TNueTJmlU9oZQdIKMn+b30eZQwrsRwRA
UC5Y+zA3eVYdw+2QOU1g2521OFxuC7VaqzOB+3wW9e3HBdEp/EfHj2taeE8UReX2Rn3iZ0B3rf+9
csxMMNr/KsiEOted8iwjbQTSaPBD3lW/EgGXBQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
X8tbdGhmkA7Qf4anXMCNokwXYnKjtwdbb1uzCGOlR9+//rHA7OSzblgXBU8k4GmKJNwHiWmzAzW3
lGGsfpFfYaP90Nn5qB7xLvetxPYNHh7CjJ0EuE/PlChqY0g+oyWTB6EcDal6S0k6dRQOqwflgy4b
r5fBbfrJidh2SMOgmGJ1KZQR4RNsh2SXj3HVK9WCmTS0nNQR5o/kFyS7J8xct/0zct3qC7RS1Zk4
+OT23GGdmgdx3lSmTix5zdXbmkZEvreDhcqSp1bHVrAV7evVssJ3OUGPyJE45J3Y8Rf8FnJHP3K2
DbUlAXw+J2gecUdiozg7lU/fMQc3NnTulpDyOg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
lW6zsaaoFJHMT1JRRtRFIECf/BtfC+BiZ0civbNK91CB0LzYy+rF6YY+JNAlirrdBMS53pQdjzxq
ibFa5OdnGdL2UCNvakbRgPGaX2smOSGZ6f4sEWY0SbBvcwy2pS4HPpF8Iy6EJadevg1xUEkMKzIg
ZbzrApCf2R7y6L8sk+Sw27Np58jyaSjipUIquz82XAlCRYnQEtHQdR2QW5jU4g038uq3FZB9Ahlu
WCc2OfFVa5hzevbrKnwEjuXzRYcaB4+4HlNZoB3JA4Iuy4gMo3/Y7nKh0xsxrsNYM8/GLcFW/oLv
umFOZZO3Kr20nHRbzhWqR2ov9nG+9lQ8h1RkLQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21712)
`pragma protect data_block
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
`pragma protect end_protected
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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
