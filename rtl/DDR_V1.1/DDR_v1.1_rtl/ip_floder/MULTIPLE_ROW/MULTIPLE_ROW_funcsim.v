// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (win64) Build 1034051 Fri Oct  3 17:18:25 MDT 2014
// Date        : Thu Feb 16 18:00:58 2017
// Host        : FL-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               E:/v7_2000/DDR_broad__v1/src/DDR/ip_floder/MULTIPLE_ROW/MULTIPLE_ROW_funcsim.v
// Design      : MULTIPLE_ROW
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7v2000tflg1925-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.3" *) (* CHECK_LICENSE_TYPE = "MULTIPLE_ROW,mult_gen_v12_0,{}" *) 
(* core_generation_info = "MULTIPLE_ROW,mult_gen_v12_0,{x_ipProduct=Vivado 2014.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=virtex7,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=4,C_A_WIDTH=30,C_A_TYPE=1,C_B_WIDTH=16,C_B_TYPE=1,C_OUT_HIGH=29,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module MULTIPLE_ROW
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [29:0]A;
  input [15:0]B;
  output [29:0]P;

  wire [29:0]A;
  wire [15:0]B;
  wire CLK;
  wire [29:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "30" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "16" *) 
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
   MULTIPLE_ROW_mult_gen_v12_0__parameterized0 U0
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
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "16" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "29" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module MULTIPLE_ROW_mult_gen_v12_0__parameterized0
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
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [29:0]P;
  output [47:0]PCASC;

  wire [29:0]A;
  wire [15:0]B;
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
   (* C_B_WIDTH = "16" *) 
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
   MULTIPLE_ROW_mult_gen_v12_0_viv__parameterized0 i_mult
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
jEd2ijxUIbDSYds0HrIBRYmcRcE4NxVbFyLopHU+NFeoAQgvtD9wV3ujs3ajdfnTCa92L/HacGYz
BOcXgiNV+YCQH9Tg0rEXw+EDf1WKLeFh2aAqr+mx6Iz9/bxXuE4Lh1E1X7td+VqVgIfVzkTECgcX
HgkK6VC3XXZY9bYXUGvA8QpOKwcfOgmCfiQGf0n48PO+Hl6yt00C41L2ISiH/5KkUcHyBU67fqt/
KVsm7gr0snwRo6P6eZV9RZKRrGaDDeZq1ERECHG+FzHzBQf9oMJ4oTd7NclEWu/Q69KARLHiNCQ3
cn5jI1QtW4oGs1Xi4ekF/QfvlBJUbw4QHIVtQg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LTVmmhwQjgRxqq4XRf1ZIt14BRxl8wjlRJFK2hQcw3Zw6efgpHvdwGWLoHWZxgo2FNlZ72VrWXX2
Fd6r1A1Uo6FhDnXlOn3jibXWu/rg3yaYC8OV5ANvsl+TUsqv533QL2KnE9KLBb1VfaJFmPsYXJIu
LghY6+ZrYjrHXihvEVWM4SMSLCfxSqe0pmG2byeKWyYJ5l5G9xPsQYAPIQtohkLf8IePM94afa8l
pCsjp2ei49s0VyZuqvazOdj5oCBZ8r+DCgFCf1kcuImQUjO1GRwU0p+qN6Ph5qvrYP+TKz7u+t5/
1sf5wLXuwEI3o3yAsxOYVpwJ6kyaTL76EmM5mg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21696)
`pragma protect data_block
fKp5L5V7d/FOWdoXD8G385AUVAnvWbVgS3J9anvsRbBbbIoSzcfb9qwbFxA15tpW5MdSOAL1H6nU
McklXLPorEQtEMcIBJgpqhAg/eIMpwox74JReP4HafFpnigN/G71AzR0OVT9JqbUhFtOdphm09KM
yB5q0iYH0nqANZnAXqnlLLQHpAYxS1TuuusNvjPjPaQcn3m1M28hyNuDsCbRo4bW1PdmXGFs73Xz
+GuM7oxbtKHaBJHjd0htRGgR4ephLeqJ1NhPzR+tl2oRBp4CBKiWj9b8NPQmhj7crrzxaKbbYQpC
kEC86IHUkJuhFPqr2LPGYwoqStKkEdtZrXQdI8obAxANDM5qfjeXB5dVoAs0yIiToqOtvr0SVwDl
K90M7O5rorCy8wFzyNY8aUu3IiqKhT2FP75LS7LwSUQlvgsRx5QkmViEMsQTzMxmPr3yPf9p9mV/
ETpcQHDwduQnmyO5Xj69tUXmbge1k63tyKZoHSoGrDioZD8sOSHVoC5mOW2LC+gt/R3x0PEBhlgz
TAP6HQfCeBbCh3mjvreCsNniTVu+rc7zhUDYn1a5FRx0pkU5MM+ui+Q4XCKO2xiMFlY/uCjc70mZ
31gj6/dqDIomXPMxcVLEEnKljrSFfTBaSGgCWDFwAHlkVMP4pnZl1AXUw8Lik2uP87stKLdYA6LN
2wXR5gLy5QsBRNiPv2lDNUxKbI8LsW8sNMtbRID92NQXeKBrVEcSHhNJde5/rFbvXvZgHEPyZ5Mx
HG9T2pZ94U3/fdhCt0ir2n2zE59bXcavqHvT16+Z5lXBEHYF7U3U38kz0w4vGqvsZINtNgq6TN7P
ENtGvKe0g2KxOwO7KnNktfO2HZ0OEvi4HaRsJVqaRvAV36TpCtyJwuwtioABYj2aBmcbQIpoz3XT
p4bfio1vZ5QtRUZxI33CxOc2Cc+S5JNZ2JbtTr43smcE2iUM1886at8CvMCH/I/qftA2E9zT/UFw
zF+4rtZGimBuQK9wVnTop+k9dT01aLMXHogSQMcLGepj46C0XYzdsNnJUQAfxYK+9eIrvpBP5oJq
OWu6id2eJFU54sW/JccXGZcA5yNf7XJtcK3BMhSzxgU2MFAj9LxbmriXqijp+tCSk3yA3KVPPVQi
vFCaCm+Jn/IA9flkDM0Y2x8WbU/CvIRVKB1sFJQrZCQbQGuAEa2RHQGNqMIMcX1aqliAZYr3j1Oc
L0Uom/t8n9Ip0YO+LFgqSaKJbSddqqMtTZkx6K271wsCODKDTeTdXtxq3fyB1mrz1TqxYCAmvTve
kTUF3a9ahBzzzIyyTFVm57nNlRvKo21v/+IvMTVcTYOU+fc9M4NpYWElJUoV71n2JXNiHyNlO5Mf
gz8YSTT/vaQg9GI7mP6ay0qDn6ruOx9zUJ428LaKTWUeP6kdpw32GwtOqgIYNeNcSSiWF3XM5RHI
yaW5pfbtdhKCM9d9vQew+kmYK4lPnx4xoYhkuorZZf/ZglggfJmUtxsB8KSSGf/0jrwpJky3+EoW
1z+bg/smP/7glygUaQQXGCbXxQkYDyU/9winvibSL6dQYgLkQ0a6ee8/jPk7wZI1sauGa6tllQ+T
4teZj+8icUhrRXrYhtdeuj6s4eI82QL9L6wjp398spg1CS/n+mzZLUmrUBtGmhWnpiieYCqz3L89
/iARwQUPbXuviR6A+rrC+UH3kevZpndY3+72/hAPYuf076DYd3+m2cJENo3dMrNAjKRLWjbdqKEn
KpiRLbwp19bd/Ny00RQLgebL8Go8HE1ekL+50EP2aDxSZk+dUG22QHLRKqYZNkZdORBTaIGyXPFV
udQDyUpGGXCJCkJa+MZT7hAeSVMhB3Hfv193pQBUU0TBWhHgINPS7Cw0KXJJlRXYC53mi3jKbYSW
4w7E7g6EfM/2GwaWjzudQgoBX5Vc9nbHFrvURvnuBiKPIkvdrkK6WaWdE5jOcfShiVV/WfqPcY9z
UsJOu+hAAJuYGd3RKOlEpm49Ug1xYEHWnkyo6YniLm7FvqbZbP/4ZNAWxJjDP2IQcWExIL7Lc9uV
mN7KPdIOGaH9ynOLrh1BPax4aKK4MsASRmEoHwGNu8+yuGqtF0r79GQmMaR5IqpZ5EvTLj7VTBz7
nnxXZxyI5vp68KYB0iDODEDsaHkXtW9mCpbmiO3E1awtw7nSYbrJQ+O2s4Z2nZca+Fm9fkZlEAbb
IsldbRP0Z7tFt6g+dYwJP1UFJNp5F1dhl2b9Pb7Gm2ljYc9gGFspGDd3roAq7WO5Sg2OfGiYig7C
D5EydOk0Sh7ZF8zeeVuFJOgZuwGEbpb/UU+1/nsDnJuP8yJUPMa9+TlNTPbIbgiIkXnWFA91OMtl
228ZVXmjVezWuccw3ODXFVt/BxCW4pnpM9AQw2Xf/Ojeuk8xQP33JPCNECHvgQGs6lvM4iMOQVA4
3M97/6C36EMmUhZSeWNPAX8NwKhf/ZFowLy0rgXk59eQvpw8w+fTJCuD91hBh/TAtvR2VPzjRMS/
vHk1ItC8pOUFTlIpcF7YgGORAqQ6BRdIa4En41Jm/sfvI7z/tIO7ZFHBLOwX+/vDCb0S8+9PH1P2
jK7k+evFIZEmQAU7zMtESNMOcLSut5pl7UvMRzzMG+el/z55ecpI00g45QtLasGSYoKpWWmBgVFe
gZjXgBzkSOL/rVd+qlx0x1EnqmL8ibZpV6bm7Fl6EniNqxmq0uYqofCEsfcyM86MHROfGWtFufI1
4gQ7eOKQjAU1gY35nmSeoI7Od2aue+wP61b8cdTASNV4bQR/Mz0Z4cxP3FPVKpoUKG5JgXeBegrF
0rsqEhcfM6+6il1LEpSOW3O1FId0NJDm2olbU3X5Sz3EOKbBxp4mxmdCSQCTPLZK6akAO/RVmMhc
XMnjNtF528sQADpalZSfdWdwe+v6Eyvbng2UUEYHyVppv/6BRGjAKUgc3uvUPIzYDP0FEOwB4Nj8
vQ6mIWl6aojLaOD4WcuOcJTbOjvsXidAV4NEhSeMGw0MYL+aMyTgWn8/bsnBJqFajyr0mnRp+SkK
rIQy/tWXaJzgYwjYzzEkQaiPDJj/RTfqvGkjt1lI9crOa02ICmohct5OOqfk6n+cw3BNLK6xiVSz
p0g1uRnDuP9QYLu+9K6gsyO+uSMvGFyxxdQ5Xv8Ys8llvoZVBFcBx021BHrAuFtR0Gyk0ETKebpj
ZBd1SZ+lPe/y6WCCjnFKHzqckCFSxeVCbsUqMGVj8PKxnrkAzSdYR/BNBJtwxcE8WwnX3r8TjYhF
5tEVSLzqCCSbkAasyooHA0CghW2M+MpS8rJ/4HJhk7/P2K3PInQ0fzJhw5G4iAUPPLfRanmVj22O
Xw5fAxPxAp3s37HC98MgQ7F5qa4U6R5oKbGjsBIsVq2CpD6G0bbMg6CC7kt1782nHlkHOr2i8QfI
LSmolQfBoBW0CiiPYoUBqfZHMYFMVKlR9WuuZdCC5+uZ/xlbR6UTgf4nRUam8Ro3H7P2VehQLNKC
IK5P7CR2tA7R7C4SZyIBs4dihnc34VPZRzzE4f1e72kqVgfwVqsBfpTTQyR0tkVANPgwIoV+6yU+
ogFt00YB6PBGtXPPcYnFB1AMaK/dSVJ4qBwckMlaJuMMJGZCeCgdrLSiBLsoLWto54t7HOWkI7rv
zIbqXXVSUq7qq0H/qpjWyTidGyfCwl47xI+kBExiTfVYoQRZxNpVJCdseTp1AOe/UDkzgutNx6rI
ck/5syDe95I2+Z+p+X7mHSg1Oo3hOq9Oibt/ELhtK8enEBG3nD49QJruxlIz+sVrPF3S4a5p1tsq
Ik8WPEmrMuH/TcrTNvHiLZW7FKOeylMlbfGEUqWnOa0tgazT+WZKYnOxs2ZKS2kjDZog4KxQw4pj
09tZuyVrpJfUCAEpwue0OLXM6JCq86QpffansK8q3lvuCbL5EnNtKma8ZXDGMo38AgkR4rPEWyH0
0oDw03wYCVpCxIEhR4Mf+cLQ/p9UP/VnYdJ9qvnitonIuCL8I76ISPRrxWpz7qI4cDlx3qgavcyG
5ReDJtW+2Oz8//TD/Q6o4v13Qm/Ixp4Lt3NolY+gZFbPts3ehGtHbVhM1EmihZGoMiPOYrHfeXWd
S4TtI1SSl7Lwe0o5uH8k4rqcy+82+Qh8Q4YSR7jvxcRQ8iOyMGTs8yKUldpbttLFjBtAEVCIwxQQ
KTPjlVPWIADUrNEGA82s2ntBpQHM+PmCFQ95MNp53skgx0/oQ/z0/ibQUFm8jwGTVKe+W/RhZp9r
QXXy/W/yLXG96+qlnfLwcXS41pMYkzB+i9GpK/6wrvtRfMg36kaouQlkkBJViwoTzw1+a1WD1fRW
YznYtkShdwP/E8wPTqyatUQcH98Did1VqiVwEjeyASi2GERSyRjj8BJlcwEIHaHxoydtlSLJ0ShR
wAYyA3uIJRlN/llbMhZITDynSWyM2vtXwODafLjzUb3l8v9UMOoSGoYfjLEu6pCy82Nba20AWIk+
GxpG3X8Q5bFwn4EZiq7yG5tMDu47xyBRMyGlunVv4fc7dGrsvbdojeX7HvY1RIi5VG+/E5N0C6TF
I+5bJh/uy1pW4lGGsc8yBsGNwKFxBW3rrzjhg7YRNUus4Xbl+DvwDAW6Y4P1FXJzQAWpYLtpn2Bn
fVCc00mTIoXciM8ikUQnzXeIJHuQdj2jr1tNG2TdbhjyiF+lu0ddHqFKKptZcDRJMWhtN7CLwLnI
zLALuwyebNzO27mqbhNsNTVzJX7Hxm4437t+GjXURBR7uvJEBhTEqo3czXUzCc+IePtB2VuIHqwD
hQHvWkkzVxal5BR7njkmWCQjyfZFsjZ4Ppg7L4Dz5xz3lgkeUaAewnKhrSoLslyFW41en6I6SKWu
QgCVlzSJERHsZ9Fho2qdtwWLz17wUzXt+h/zmxGdoOyU2Sr9jscBTosH5/tW67JBfct/NpKI28HQ
sPjJ+fYRq8t/RZeYHh3GwGy8KnHDevUFh3HgLLNCqHQNFi+gMeQWcKj9Xz+LdrtqwqNiZR9wPqwY
rZ/bub+ZT5DpZCtQhCz/m2YQzOtSKnCJv7THTmEpZ+/Z/FeqOfBuSocaLc+GMZrtd8+cn6kGepZL
Be4taG55null+T6prOw0vk21j5Zxqd0md/KbMwLQr8dls6rXo3/Mbz9yrvVTkWK1kLcOLlYsoWww
zOAAE9Bebhw6lZsnbS5CXUmwhduaR9joOm8nJQZCLbA7Ii9COQH1Q71ewCyzoxAmIkDUaLXk00Yr
/2SPPR4siPgcHvWYyZjhqWQmB+2TEV6AoHw84/LBavpPolP1ww0SU1eKJugwITLjJXH+zlbIFAws
6QHcJSPSFfKz94QyRr4M/139rmZGKeQE5AzN0kxB2TvYZ6wimCvD9yfbBsH7aSlt5RiDO4ovT/ak
mYQCzA/XQt+D5H9D7smeKom1AN7vQ5sGUnZttt0XYQVT18VOcMCAc7IRoE2S+FmtjuAKD7CrGHd+
yy/TPtaiIVGEs8G1FBHR0sz9AaFf0kSMclVcu4Pc/G9qfSW6OlsMVutoJ4H7el1egmJske+PcNVc
BlfLYtwGb9PuF0VETrAocgH2m8Bi9blLI16wMdyUuDD2zq8K7fCqNkCw7nU/ywVyvhMn6DRt32CV
S9fIImf9HB4PbB2fdRwPftJrjqqP/pLENL3cDR4imOaC/jPX//xh7SXefuDnc3Lm0X8cpZmuFhXe
XX0MXmB+ZCIjTXc4hy1i73wINWA2R8OwI1npUZ87E5ZaMRdyTcbNT3HFhxIAZwjoXGSQawPshk8T
MaOWFAGIVafVi7ORsBC3cUIYA1ytKl88nx32GBn6wDGcAzp4mVte2T7Azkf7SvrwxrQv6g5z+cuS
sGNDygIfT8snef39XMbUy2c2k6nBKlN9Uyu+pEnAUCs4CqpGJkcW+nkFRkDCBqS75mjSeLq2naJK
P5kpKth45kgrQh8k5cQ9JiM9QGuNNIxxzo8n2mJA0/Vod49t6W2z1MFCKTzuRoWt6gTwx8OhGWne
H4bXXT/iTpRVjojkcrf/gBRWdTbOxlfMaDXhbve+ppi1TB8o34nYhmNTg1VB1+yJ+4ZHQgNIbLWC
e38dszwZq8sPSVIJEkp13AT0hT65rk07eurFB5VfKQU/cu7smgYg/0b8thfCBRlQTXxofNALxQ2E
+SH2f5cHwZZWPtISMRucs8/6GY9ELTIFFmFmsgvMmzZJ76W7A0zuSXfzs1OZBBIrHW2n43q3cI1q
dTOC+2iPIsFozxd8MTt+okB9Ae9erLLLn1S5OqaS4PnaXM38BW7P6o/cMzzWSrIiLyJh1qx/zf2y
DbHDrbsrmsf1xJQUbHq1sZdBpKeQvwHb9JzOMR2dJzYpS5iix81DxQemEw6AdG5rbyNYNwRzCqFF
e/0E1tNhXTL16wBYOh27GXUnvResCAWBn3y7h/hYQ5rb/QOATK9q12S7JkvbkMr9nChPIpcChPVQ
sJKRfuGCtiUjEEFBNqBN63KL3u11fYLhle8jDYmpTF5WhvlXxzLOvELMDUFygbDKUGZ77YABAb8z
58ebPoxQSaTozacK72wz0DkV4sEyvZukKGmPiR9fwPFxI5wRgfuoZEekCUj5dkF908XJN4vdNhN5
OFzlmCHZWPXxCMuYsmXvCeosjILTKI452n/1/YZ93cgJwegkEbRPH0jcl1idf11W6T3MMhseFjxY
7LAxsnUvyzoN05WggshiHzSxpyhwBwg/GDd5b27DJ5pNIGDfP3T3aHPVWOWibGS+CX9RPQN/TazR
+JkLelZVXd70MQj9jPvCmpsI0t3JHKG99p6Fvp7ZaqwrJsNVH3gJBbH3K48pc8byNpPAieSsn5ue
fPKmUPrOMObIlDtyGVbrD1n75LPKP2nCNal+lVfli3snYhadSWLOVGvCvGYkNGAwYgWh7LL+zpD1
Ik2hzpxMktnmNE5fmOkbY8J2PZUiQwJY2LKnPNYsw00qXS5oWV2QAtZDa4zcEQeWk7d8QXbCRR54
qo7WV5CtTta88DVkCMbZajwF59KdUJTkBw9xcSuuL22tg64xW5rjA5Km1vnblqzaJr+Kk/f33xOg
k42OwiBh+oH1E0bcbWkSEsLWc0O0OuP85Oost/HQIAutC2SwlusVlL9kvY2v/fadYD5s+NcATuLd
FGuTIGwFgIGZ80wzJnArkhhoP91Bym8mu6M3s2BBSH53WKIllDFuKe32YLl3/LdEmcPg/WUdC0aQ
e/iEx3ywvUcSN3Gv/qpAKQDu0ifHVGYws+umpQ/V7msVtQGnyU8zHSbrSW2H+3N0uO52vGsRIQEH
A2OWTCG8XWim0VHTUanjmmqkgkwIOTS5MP7dZIlkVBELn04NBq0PdvVFhc/tZvd1T8JUYSa1MQ25
bKboZUji4T2mJ8pRTM8IJLJL/E0Z5qLsnxQEU8Ncn7SNjUPyYwnAXxf1oQTSxZ17KiyWa1zBdN4Z
Gwd9WU3dZtP1jukcuU+y2BDtaJ7oRJICZRtG+GDckMpwe7/ole6Ml3Rlg2IX1Wi7QnWrJKTWBdvc
xLVSrPAQfNH9ly0pjlGNI0iy68KC5k0ROgS8UP8IFzY3Xi160bjdlol7i4jxnw5K/jTkK/m9lhEf
jomrWpxfoOTHyT/I+VvfFJqk/wqd+RnAufiQ0GPi9Or+2Z5sRmKAObPuX2xF5U7me4eefhFhXZRO
uiXPqwTCXawbDkjONW8IPHa31j1EVbSNrknBDbQD8EzHHHRq1xjIVeGVs8zwdCb/Ehslwauckep5
Sn1gXqAR7f7iO9AbRKha3kTKG/Yx9olfMK7cIQYJPXHDeNvBy/e5H1ZJFIhnuDm4uJPq3DkvicoT
uKLZmW4GGtVlAGoM9Ki5WFfCgMvd6yoQCwPgsvniVOCkciMzINdkxspWyFTO7m386OQFsYac2Hik
RHSYGHwjS8cfAleookGVO5NFETkiv1o5IFrkvA1w6Fkbi9EFCvU/re8mVqHImOPqx9CAfW91Am7r
MHQfTei4HTpUJYAH4LyNscYApWt2e+aEitJe/rPjVusfv1Dz9VrpnYjlISEt0j4uT9LT2n0n8T6d
6WD80e/MsSTGbCYrkyD3NJ9L1Ksm3HITWO1cHiJ75WP30jcG8dTNEiAupzGRtfdXOMnxqVaTqpqg
rR43GWSjQDAJzH6AOFCaUhr7+3Kh1Iuh8k1dpI5X7/wepb8tTxN00qdM2nBRUBtZAFrSTwrS9c+v
wv62WLHEEpdZOnC9virT4sNY41/f8LQDyd0xpSD8nzDbHxpe1hC4h9sEXJWLwMkzP9zBTwBvnPWX
1Gd3akC5UITUYOLm/L4gHaTWp3AAyZidSslR9Lsw8wfBkfTmqRhg+KW3z3Yyjv9hnRDTr0JRfWM5
r4j6qz2DWegAPm430C48p+81oFIO6WfE1coFLEOuVoS6O9ngioNmB5JmbP96NKXuPy8s/i2+Pb/C
3w1Bhk9UYCfkf7sJgXJzJNcyF3dOqt09juQaIB764CrUgbj9Oo3deN6kuqtdC5SuMN1EEykLB1YF
C9DUz5yiPk6QJDIL2e/8idEXsEQUtwyxrwHOhvFTMVAu2Ai+piEAGnyln9vXB6y0K8M2V/xxICyO
p2thLFgMVf+blpQS0Voh8xTbbdwDF/uifmpCjkbk3a4HSzua77ecW1uxdqniNVB796INdymFd1dn
xEbXJ1qC7iuAa+Kg0GS5qidX9vEkfoWJRGLEp4Dpe0OefQMvUYzqjQl2oDkNQT1gxzImMK2I4kaE
SllN8YDFAExuDI32NShcj0VoB24TpTOZUz7BqYoVrEf1a1jJvmAH/ZYYm+A4uIgMAH7Rq9lf/rfC
G8Uu0qTUMEeK93hB/mJoEnoEneY7r4t7I+hpVWq+Bs9aAxprFEk4r9nzYCLV+GVUF3QRgqAHmHxa
ZTGTY3iBbZ2Qw0RotSDXm6PYdX+ABPKxnoE7IFa5ePOjvfc5bNMh/17ArVXDEmJDI9eHy0bZ8TDJ
uQIyNdC1kb5M4Go1YXpimspOHkEktJYNbW4NROckuZeB0iwEI6RvyFiupnv+K0GU57TF7R5ybzSP
SHShPiWoT3ddyiGMcJ5WXyQY9JQbV2HCzVlDII2IJo+EmsqLQHXBZeIOFHVCzntq1F1PQW8qHWtV
MAW43HTObc4i4TdnSJIupKEbuUsVS5Rq9+cB+Gtk/O5CuDhNm0Yb22ghAEWjXzvsS31NUQBZ+RdC
A0VYBIL1IKLdFkuJzVNj2reiJqZJ16zzQQ9S3va1soT1w8qS1re5xgvKDi0h+xYBMOq+WXsDFpjf
JCv81e2hCWwEBBDKZApHx04iyeZAOC36hq5ekIyDHZWw9PtZTPqXyI/O/Hzj7/Lf7whgaw0HJJvq
v9ZeR+aaLG0w6g+lzVZzlnrcpcROgPhFbj11Wjf8/f4RZGXO3hgSA5NKK7aRboAUfr49zk3nwmi1
N3V0Z9p44TOcZkdayUvqoiSUN7CermpD6iNotSuTz/KFHTWmhiTw+ypwFjnBqKI/G7TXeOrme1HT
lkan5LguWwtwIAAkPk6HlN0BAUBo+N3eEYMcbDG7U+EGSiBan5wBipE2g8oJRwmr7JPlwUBDcx8E
RSdH8QGzscetrQ2DllrVc9vknpeMsZpfaGC8d+OVrPxMr04WMfiYNBFOrNqdsbJJwHTDzzwVEVok
SCm5Eq/GCFUpbeCdyi5rQNJP+6b7ROFtzeZfd9GjRjoI+a15ST/Hl+XyDMsKMoaS/3dgSqN+id2B
Dkp6kt2BEtY3DjpLQnVcmmfOdx/Dqo2L2amYYAFqidWAXni+N+KAzPmj2Oc3/xjPELusByiYIPAS
8HydpauxnO+HIAhVMA3Ywb2wRdRVU6gGU8JGR/FPQMmrZM4BltxsvHpf8VpFDHtrthUIKkp465Pi
eCGRBteV3ARRnxI3fhoK0bzrTqysPTQP27KxaLkCWPmOeBbgx6AyaoXZGh0QY9MoOrt5zu5PQMA8
ysdar2wipdlnHBGL3tcKqsouVBsNM7ObMeYofh9BPHudFUWGAP19d/ONh2TP3c9eJVPitx+NZpWA
A1T45xYA4AlDtolyW1jRJhylWetqWK1eZthl4h8EGumcNNCZ0gxChfxWaZEtAe7l1zHWuP1HLSFj
S1sZ4jorrFPWXLqCbo4db8ZY1QtP5985FP+It4BWJFodkRbwkZbTP3Y9ZnJYEHd51INExiw2hdtQ
CvVl1ubqvzfIJX3u/KgHyW7UeMNtJkSjbKEw+2Epd8q+NGaXiKv1jGv5Ey8h3kzx/lDTpKgzxm3A
4V/qsXcT58IGQjjW6f3k1zeQ3nDuOaxqRbpUtfQFIVoidmj6INDYvL1UnrdFhDITPWHIAOd+wHrg
+UqREBGzsGC8WM0IKlacxDAw9Y2wUcdXUmu5zoLlY6qCGq92uP8JH1HQFNc+KyGlAfGabWfTIw2b
yloze5cVgp7wVzM77SrC/zU+/xywB403+cQOs+bSi8iTOuBeRUdBoLf4JDAnatoGQVfmsM2AvXKd
V3Mcnrpq8kDQXMwewfjHIcr0V7U93oOJcviWwR85JrYda+5nRDzATUkjRwae1pnDJmUx0GScihDh
wi/vDjY6MnCPDVrmJdLbqmnhGapXQOlPmqU+mAIz5ibdsHr11DgZnLrK0EeC9Y9qsC/KaH96OgWk
k2awzd8nwskj6x2Yy8SW8yMuS15mEaJqbs4hn9QjONo3is01PBk/NXzwneo+Xk2k9E6SlehozhZq
jOL5IRUMpzarwR9nXH+R09Ukywvrf2YeRyrok+krar7m+fn2t/CsI4dG2165K/tqIm28i58fErZc
yQdUuLcEKNfiiiLoVgLwk0DFoC3dwIEjtFTqqW/RIEJA9lh5Rdwu6By2SHWaynfquEH2cg0n+LcP
OB2oU26nfrawox8cZhKAFrwmbEfygGbKh2Q+p5DPZdjS3w/KCBMrT1xFZ72oxs59tnEzsoeKf4bf
eyVyrfbeJlr06WjYwUvEMr1NlzoWS3FrDPVJwOhUDN0Odfa20dTAE6dijIPVgogSp+eINGS+GjXu
LymSLGwxIzBBHiNeR/A99XFSdGdwXKUuCVmpMxZ+O5ekqKKKy6yn1MIMapAMndNebN/8LdyYAW2m
8onbjVSwOOBI7pnoj+HTNzwXyY4I/5gbaIHGF6YSg8AtwwfvnwndoyHMR+HaYof3sOR9Y0gnBJVo
HfHzEIh7nKOkc9QYqTPSInlMpaSh17ieuQSTD/Bi3ltAjtOp8VzoBKNZnQnSs1ZbJDf1v/DOTJUP
wASg1RFYGMJl6m1mxgfN+uq5mowSqhfvGackiYd5aJzulmgjx68IBYaR3GydRg8T6nbhA6zoQnFm
ZCTISkcL0d8TCxjc6J+xsRB9Sqd6YaWGvIZc3+J1TBpDPx3OGBW1+SNX518oLvXAiF4i12lcW8c1
8WG3LZ4TQFpwR8oaTEtC8JtLCawXjcbp4Y4eeoaBZnvvNxiFPHsJ2KEMn9JXtzqhiC4OwXeUykjB
AH1WnwH5BeNSKUg6NTleeWD/Op1c55D1GCzk55lB032Tp5sVj86JiuLLyw1uNAIZz61EvVomrehC
K/FFOhC4hDQPNJpRTlKNReWLp9ZZPDcxsfvoPEwRBiRyz0CqmDhwymVgJUBFKXCDUt7SfNI668KR
bwDHe+PSROtvD+6NVaeQ7mCe+Dx1NT0yOWLdodlXNdooPLF48ZmdmgSQ7S8liKB+zpNEJiuFsCq+
+U7WLnvXnoxETziJnu7pbk2hym+KIJI9Rv07uA2lEMIOokRSuN1p9lC/PzqVC9A6cZsK4Czv77p+
TSCDHs0B/cu2Hy3qF2oVoOCss19ZmVUEoReAG0LQpHm58RXq3+Pz0ZGfFUfm4IfN7qGfGn22X7nz
rJGp/C+1FleoXdWS4v1p5RcTBodiA+zkupPWyD88fxrYasm6I6B6RZiIaXPBchUm7zcimr55DpkQ
TbzJcH/sjJ4LQcHYEaHuNraSEikb+MSb5ER3toZYr6Clhgtciu+voemr6IlbCWs7FHnhI1MjH8YI
3JrYzPQCUjp99nvIYrteG53SdjeOJXN0C+heCNOD1D14Xh4hQBnADmTuRIuNaFEVtTGbNrl6NBJH
r2PsnUZ2ndY8a9W1balLb2MCV5VPcGxXvGla3Jdccv3Wvkdj/qBwm2zinvAUOMAramu3dvOCgVQC
qL3f67axIBwPydoaGWeNrzCwROG57rZT2hJWVygsZtwgNE3lx1j0uTC+qFW4eHDlvg9gaepLVsEQ
mCIiwRkITRvw15DaVbbl65cIrWkn77LeVj0oCTp1ZmbZVWI7OCXtpSbIKIH6FGsDMcc7x7VJ989Z
ZpEdsrhtwEEKETkHSp+Gzo4RwLBoyJef2/37ERl3pqFZQ/fKK5P7rSkeuNh/eVw8SqcXRixyUD0K
KyCQdrBJ4Fp/j7hi+xd9zXurR1QoQR3BE650BkgSkWDPxsBUewL4K9fUdFvM2kO0jIBH6ODWdyr3
M9ITTr/96aGUM2GEfmckiKczgojRJaynli4nVo/cBP4pMfanjcleKwtY8JIRxE5hb5xHqCPZIep3
Be5ZpHzaLofloUkk0r+o2KE+JIy7lCTxWj5TkcSAjtCpIU09+ODo/w0mVzgtIduhyh2D/SjJzwmw
LaXhuyg29NYwP2lorqygA6GajPv4OjCwzyVw1MVkNbCLTjrnX1UU1AzNzHrR3Ws1x1JN4IgEotns
oAqlXiLPgZ/ISv2uuNKlgXrOuu9Bc72NHqZOv4uYWEIn18AYnVcCFvBQdK4rQhOngssooHWDVnP/
xE9uK23gVvolZSBnuCDiBiFHEdyOT7GH5FbJMkwBTATFaBwEAYa13SPeqdJTlcOAJGpUkks3eMN6
u77kGsqdaJ2FWHOeuxHeot58SxE7PvJzr31Q2HR/SIN5z9ZtUJjF7sGXcSZlFL8gpFscOlSdoLEk
T2M5SPvbGXrccbRTlr4tZBLsouAtO2ikjl/cuVJ+nRr/C6tC8nM1O3yYQ8vxVeI6bEQf55sq9JuR
C65f0K91iUMzhzw0GGY1wwnYJg1+GcPKWcsOyQQPQSdyN98kbXHitu8Vqy7lfoTkvk287iPUhS52
dZJd7nz/94SN/371drz8Se8ZW9f2iveJKD54a17Xwgb9v+wUs3Fp/Gd01xhglaJ2xmvu0IO9VwcJ
brmEcJ0iOIeP1pEG6RQZiZCK+63t9/WnRDhm2el9ocHgst+Mhb4PtSThuuw10zCwwsKXX43aubQu
B+G2fl9z/ythSjv++5nG/1PdJ7kUVOpKP7qUH98PcAPtTI41n/0u+g2kbJtQtNE5/u1UxvIkWxw1
iy6DEklP/ho8nF1NQxPLDMaV06Yxt20+RDzd3NoCrzDrHrrETPv2Lprfeeon/AydiOhBUfH4aaoK
5rOvuDWtWMnVLwobMZclWSojFIiqFWGxEPW+bP19enabo0OfGox5beGT16stpXNFXRsR6VfaZk+n
mKO5xkBNhqo98D6PB0aFwlGdejD6zZqYwAy0kVN4tKUeb4nEoOpjxdysULhtC3ed0k2rukmEPq/p
Tf1C/Ys1nrovh38N36S0Xfn6YdcmLilqGLxPi84QXGJciya2NJHE4+lACf1hJmmwLRBl0SJffzT1
AeB8c0EYRBGJPDn08nUo079yNqTFo/NFGxlbeAF+C0+SmnBTdE5yWAYb75jGkHOz1bJI/DYnswTO
0EwzQFUTug6Gb40fXMXMxIsJToVgE1EKsYBkp1N1V6kHfFUPlnGmKjs2f9gu0/DIqvKCy28Dp32O
VB8Jr7ddxcgqkJ1FGN4a9uw7KLG432/cW/yCpXXnBqGA9dilzdYFIf5uuYZqAbV7PHNlrG9sCzOo
YvXXFtbKdIShCjpVFdbn24hQPbcVCz+hEPgbVJDyW4TbA6VVqoR2RRHEnyaF806QKEHDobHiJ6C4
MfpgmuO7908K77oapU3CH31GWQLmYhBkoM3slqE3FjLjus7gbDdp1BY/WZcE6LcTF51In4R0iEhC
sNd3Uq7rsknWsevEPDcFwRB0g2dGj4IfAGBU1D11Q1RBpSKenIlF2oy/vZp+JlNIDI1qoLk4LvOI
cT8W6Dmw1YU+owWaCHo7j5IWJMAkzes4mzvsNnrrw+8GAFYJ0c7Enwu4Wu2mgPO0Z1/LVls536vo
AHB4XvWoOg7MpYjAQu88dDMl5upoTwCVwVjkuCUeR+L4ZZoc1yDzcdjyZUZllPRyhm3VFq1APtTy
LH76upEMQjvgJGJwPvNuEAV3/dcKaQkITFHLVLzj5kOrCjm1eZj0+uOrRAqQ5KNVUzpBtzQfTHGm
c+oNmlMpV84HXGi2eChLFDv6QFh8APLpkQElKN7hGzBUqaa61+w55pIyUuovGkE3vgvGbXkh+NJC
Xpf0Gii7dtS2HahkXqjDRcSsxmqOQ+cnPT8Xjqts9C7ciz+RJtFuvZcfpiyV2vBczfpN6EkGfpAd
PciiOqseBXNyGUENmihRUJfFosvpibFw0IXwgjVp0BSZay+D2xfMtCJb/vvDyXT+xkzbfulX9CXY
N+LF8rA33TyeY9KGE1guWQE8BL2kRj3Gnqle/dIkKnKfvqioStPm9Gj+/1cMXjGfDHUGUpV/QjHG
9sL0m5GylhUU0+U7YJBxELZIdw8UtKhg2QqjihXZ42+25zb9bs/2FSJ8LfUh23Z95Unu5Hqnyqyu
cP1UsdAYWgDlUm6grxbOa7dloMQZjPLNhlhWPCq2GlmwHGldU9TAyYwEGwhYMQM6GcDWMJY3Y+Kg
JBvn6hoccYGfd5R4tfIP1QwtVhrji0akp7HMicr1sfkIxKZ3FvHk8MBq7+rx5xUboGd/uJWMPkCr
QvDdaA0Vh8LYXZIqntd+NmCARsAzH2ljHH56XcOh7G7R2omraJcWwgbMeU6OFGblrZSszPKrgIOh
ycL5tQgAobMhf4mppg/Lcm8DGNqXzc8flt4z/f1L90+yf/F3yMLuNfAC+WsCKoFNiq4VOTE9qkeo
QuCXwuYo7fDlh1NkH4oGl9fmCqu3HEmBWtidYXTwxufcG506BWJz/qIr1+n2eq/58FM+5JPaiOvw
3kcX74yw1OJ9EugHN+umpYLs4RR8G1sXG3dotFBZfo+OJZTj1IoVxxEN4kdX6OZMuVeRJzbKoz+9
S6QwZrW8uSlcWYUpER/4s6+1SEdqKieyh6ajsGiDLQByKmI/Eig8zFKxcs1MVU68RqpcNc2HAAY+
wS0heriT5WnttpUWLz40MmLGmLqCTKoYlTKTby1TA+4ZrAe9BMSYPD9eC/OEC80aJbt7O7MaQm7+
2eHBqhcSEzY21kbhOVZyai6vbwiLvqqOS924n65BUPEPAT3lUAcXe7ll/cZIBJLqk4zoXJIh5CAj
AJRKwmoTlgmKnXLtceh04x3LD6ymVZxAa3f3S1T2nh14lflN1PstvouPKtIqxoTDfkEs/0LcEvJq
F/ugMviHwu9EwcD27rYN4UfmH/1dMtAeh8RJ9OoJSq+3jzRQBa/cAW4k9WBZ0H8abET1l56a9tgR
xsaaUEgE81VwrIXBIBtzIQrhw1S3+EHY0keifOo9GGiwi6I62Jnp99QxsEw2CTb5Eg5XzOcCODvS
t7gcg2QqE4fZArylwZutJvbuM7YiNveuRB8w423GsdTs3x7oFGA2s/Lwxs831cuKc1b8fKfLPh9L
dc92XTW8f9KitWEUlEaQUhjDUkj/zcIgmBM4k2LucsDFcVD/vDVX3n4Nwe/GLYU74lDA626wYb7A
GdN5reXJdMrPYo8b/eOP2tledQVtLoL3rPmCT2EYFQZS82SsheomLZcKni2VusDwge3PB2LoSBoy
NafMKgBrQD5D1dHrdx5H7G3yPHHabSsWUZO/QOY+wwxpYzMP4qndO5uxbmA3NfOE6/wDoq+lQzNC
36YaneAvqIfoA0qbZSlHd6Km2b3qc82SxBM1W9t4P/+NAZm9d+GIin5RYbRdbJzDcPu1owAUi/0L
vm5W0b/Jk56gdGFWW8D0QhXd/GWGhsgQWrtrTQdbTm1gPVVORCxUK8iwa4hhgi9ayE70JmVZY6A1
BRZGZIW4wWXiNAowfNnJ/CcviyJfrUKQV5elkE0JRbr3z9W0r2BNuOaCC3lFPJACxO0TjT9QUxG/
Pj8ptfb1JzZ948ZHTpR7OkvUVJu1upbBxgsZISYPR5tLQVvdkBm1jMSBYq4IyiO3NkAOpDOHU9Oo
IepTuVXp24sLYwldq+ZS+GIJX9fj2+Q3ORgCc5lnZ13woTedG3+WXJEPg49lhOLwV7Ns4jWY97kY
0TNzgxx8cY+cURfJrwiA4YOJM6PTAqUgFPNuV+TidoT7YcGRI1oTAsJZQhWEVnOsH3p8PQcuKTJ0
2Us6+sgMjs0z4j+GIOHdKqV8oosXl/Py96obkQeYL+mAl07c9d/s8xIPn0zhwZx/Sm5hiD8chepH
PNRnm2xY9VtXNfWO8F2oY47+NISlVkfbSuouFXmkDSAGwCEqEc88a5MLab0a3Ug02eydu/0rGgI5
h5F0143lETsLGsXGa6SANJ5EBKlS9pVXHDx9SYa+U5T7lO4eICSK+7otZXYOHbxTiN6VhmvaSuHO
x6R8Z37VcavXXNoVCXnPW1OcUmPZg6oJVfT0lLpy4gl6m5yrOEHKprABct0kBnp4Sp1sO2lsiIUZ
Dp3nQMHSI6ahj78gXArr6QyaCrm6y5ITIqr5XfL46agdnP7dVzMpOzKZ4LdmQ0NUJq4GGJnOgU83
SQSMwt9EmxJ0Mh9VKTOBU2HEB44GqArblpxEcE4tDVMVgh3QHvLChvxYybE7AltVj9ysZfMGA/BN
vgyWwO+GNz6AslXkX1uE4zmDTnh2lYYob6EaiJRdwbRbPbNXC1GDtFLYx4sNLzICBJQAThi1zboq
fm5QJ0G5TIz9PhEJ6LWCgdXXkcgg4IcDwIzX7Zopt2W/BsCPhXk23vwnl7rR3po2tQ080dvtj646
pssxzrB77XaMPiwOaqDzuLSYK8ht/1n5du7T159zbi3d/5bAKmmlf7FKeQzpV+vo8XM0KP0ARF7z
fZN/eSDphP7Z2lGNb7M+IAvwaKTResSNkbLqjOBwUl4UbOclJgBPDV/ZgO8OiT/oR9Er64w0yd5a
jLYCkooD8+hLK8gAZVNu81BvEEOG8JTvV49sFO5XCB9z0XYO2JvzI3bcxW6KPWHlAiStmtvz/cn9
l5rLC8cJNpnQsjpXTJEfZVvYpSD1Qo0QGLi5pOQg+yQ/Kr4ohtFxaaCeqkavV9Kh8G+hQxPlPlHe
Zfogd4ocLvHBJ9at76RYVsxA1JV5NKPoDl01Rhtc/ibDxvxbCnTGtg/XIPzBjOE4l1ljDbB6xB4d
J8GR+IkvkQud9C/0VGXYR019FD3hXXP4ZkZqsDD5xWwEdm4A18/TYDRhoHqI9ccnHVD0ZAEjALJf
CkcCMk9ZSmd7pf0i4rIjlmd005KdUPFI1BXQY2ihCT5+921pYVlJ62dnTIXt8GEAapr96cuMtRKV
gBLKf9wdZSEmtFSHn3+Mg+fqIKYr5Wua2kuRFU71TaR7gkwgTk6QQlqVJGt7aizUvPVMuQDeQneT
LvZhITBwhgqewab0jo8EvnHW1iH5G8D4Bf5xzYRL/U/ZLo4U9wPg/3xfeOzAgeKd9KqM/a3/epcT
zRysJw5V8XAo9rnyU1K7vmch6XlKo5q7M3MRuxzJH7LGG9QjK01TdoyAutu431MqNWPiZXwabOBo
q9NTYHl0ubHHvcNs+7mKudoc3EpUxCR/7GzQqqtQAnZjiKdv2PWpce1PjbEuD/R6FQLD1PXoJx9q
LGVmVJCzr6vCriUWshoIgJoYWiapWJaTtx+wDjo+3+C4sU3QUJt/2tIiVImbF+Pdg6+QJTbi0Uud
RElylWzjq02dU09GisFP8bvlYgZBtyPxKC6SQ+2oIEIsVge67sXKOje+Wtvz+ol4G5GCfzO1FYuH
Jyz1Klh+P8CwuHUxgyedtZB2MHiOPb1a+BvVVwu5aiVZcP/gagC5/9HjbuSDognla+Og3jAn83Qv
X71JiaZSe23389Hp1j8IeBiC46ha7GlwEpnH5gkjN4lD6pyYx6WmbzcHfMQpeuC+xnFALz1BglTp
hGkVN6vVfPIeGwu3oM2uFI1CxU7kW29XI20eMS8Vtj0a1uv/7z4RxkcCYUdtPPhl0QJX/vQvBIiR
DUndZHZ+8ZeKH/2DpJVQ83/YQbWOOeempkbnoud2wkwziRNe0m+sFxrm61NFYKg9ofnkKpAhbOrq
5HeNIMfKCSlY1JKuOfQ0pIwaKvS7fhx/IYZkhsZ5Vzvz4/Ard2Mz0Rwef6MIkPpj19esJAU+iHaP
gOxa7G5ybk+U3bgJU88EXye6+HPH6tIpsnH/LUgyapjToGZ+ZjhzvhnadvpDnBYRTrwv/7R5hC3A
V1JsCWF8SQuglniUf235HvLCd0ThysjTeQL9aU3qL+Sy8obryVTSB40Arjj1WN7laYGfXsvEkneY
GUQo4sYZ6+Pv9z7Ab89yvQAf2mnA+8kBzEk7RdWsFWMy/O3x1s12MwsETSWCVxCN9kxi7oTyrWhh
hya2hekZ9Q/CvTBP55nZXzymS0d8xxugfuG+CQ2zqHrKegUBehedZuGgFeapgaFwvV05qfF3EhoG
EKWXv8p8MwDT7RgvI0O+/b0ePf8EQAxHwx6cat6kylsH6XBa83s9TFGYhFSy3GubSaDsbpIzhyib
B8H0FT/FC1kcNIZgAc28HSxhrxDRnSHX3ukEaG2kCb3whGlZOcVsm97vCWx6z8hc6olxeZc4H9zf
/p5T/LagQRkzeifpXfdIvPtgVKIsSm/Uv+2pBGgokCxD1DOFlHrz+sE/vk17oaqhgp0qiZiuYoeT
yqyV/8iLe4fdq/NJVccVkAxdsChU+WiwBDpAOeSJjkeMe3yuvVcdDjxqKletKq0j/7Dn41hP/C45
tGzmHzNNfMAlJScF1Tv4ETkr8GdRrL4yReCWdSSWHDa2i6+otGSFMdhoiwDbHAs5EbNITnEjHira
JoHRs7S4m0HQ/vLWRcE3fWYCRp8MD8erE7UmcdMCd4NT+bEpwggXms3KDrgVOTegdY+Rr/3hB11J
lfLsi7LomWRJGMBQWOjFlyNVRaJ/iZqh3w+FQALGdPxhOXKrqRqL8xTsqCJcWh34WqHCPypo/dnd
47BI9W9ob53eYuq262pNangbCBmJsxHhg0TsQA5xssCBpLxR3swDIOgoBUg1elvfF7aTbBi63bzg
oW2phx7fnJVdp4/XyA8i+zUxbZlscS2pRgIYo/X5KG0m8X8aHWCOn19uQ6zLN5n2ENkBTq5DJFrC
Fnayf5wD4arQCafDwHvIMl6yWIyVB1VOB1myNx3pxl0mBZQNYrkMPwfegMEWyPWYTt29h6t4QUJ+
xk+lVNd2B5e08fez8rGBt+UsNOm+kgOaFthQ6u7iBjD0fAhlBsa1Qx1z6ozEmoVNzfIVDSKfaM6O
wfu52kHmJxwD/JxDMFxUtna7RBLGlOorXb6CSxayTaXiPn4JlqQJwbo1QP6pDGjGY4TY+dSJyMti
uSdiy4Q7EP6hVw3FA8VN/ZdnXVEiosU+q/XFdcs1YkqIZmdBtVfCpG2ATIA6a70bA1bekMzdt20c
4FhtqU97KBghth3xNKuqKXlv/EMIBAdlLTkGWagYIwa4p9VGVoIXoEK8n4lr9kdUN3K0ryd8MUli
oOZTLBwAZ7gjoe6x//O13v7bTXaZK1q0Yid+qnAnJlOGpCyA3ICATwgx3MZWVoL7ZYVsyjg+TBdL
cbpqMBJzUTe6QbchT4NvWI1jdvO0WAlZiiqrF1gTy1hjnVNEhDeVH6xKe3/ieCQSagh7lENIiof2
GYfoG4epimluRtLrooqMLGTD+IqmNgqFA2toF/kUpUQbAB1kgDqsRPAy2Q5ztWTSpz32+L9XUSHD
8zZO/oQbliz5+IyZ7HaB3nLHIqGCOC7mhaBJLlA+3Pb/CXcTRZqlhu0CgpMwKj+Rkb89lq6Kn/xx
EMLEYlk2Q4c8GcMH6u4qtQWFUTIg1tFemDdMFfzTBs+GH8MFbmrR1n34vXvZhyOrZLp5c5KuNvS1
Sxfv2d2CrQebu02A1HMU2tuLaWkvrLo8RFn0CXGe0U3mcZ+yahSgtjRVH3A8kx0nYzLe5WxskX2F
jCH6zKYJTmYVzBTRwzAhmUmXqU2HMtbHyUYlxuhOPUUqrqMIVaoaIkHZXTrnUrqceKbB+7YhMrdQ
pbg9HF5VD4CYX7KNMf1aVmaKY4QnQoSklJ+WfRGCaGUnmZFo2kXVz9g7szV6dOCwDvM+UmWcr1xg
cTtavmvx5iMpfcLyuFawOdr7n1jm7Iy86jaAa/vaSxF7+FzXWNlqYy5o1Bq64sYFuDOavrsJIdIS
dp9PYSk0wRB3kGtY65I68C7QViZmC7l6TSpRlIdmEdqY0YZk21RgWngTxR/6+78cTcSMR0zhWcYz
xIFni/UpbNUFCgR6RS0TW59sQftJwU4Gr6binbbC452JzWAcc5mKy4AYVQMMbF8/PdnC4Jy6NuQv
aVanUdNui+kT3eN6wyHEyB0lhOBKSdMTq8woX3HYVhAPNGc2uB69HiCPBapVKjhoqg/kswXeCM89
4fP+IWdN/Q7nsrQjhjO/vCoYiFFbWL4rqU79BhBOXYf/gcgXA6YHe8WQmP2R2DYsAPDLnN5ioSRQ
MrxROt29BxmOlhnaRbbYR0t8rhnMVTNitq3z/3F6DLdP2RuuCPtx9uVLJzSNAEx2WybyFEoX/8vK
CBJqsQ4v0RqIYoGhXL+eU9+B5frknQQlHftHJtEnP+itFt9dPzSYEIhdS+1WI/4Z56M7FvwOBREZ
peSQQSltplgu9vA2DYozHKErfdbvEgECribHaAgr332fJrSWRgkHCDelOXxDAbODJqAChMQ/v26M
4Y0dsvPlcB/bqDnxQr2nZnt/RaX+IuPeTGzI+D5klDHB9mTaI4sSYQK6hfWjlM67pnE5Hl7P+xOm
59BmWxki0HUTGftVSxXe3HQh81Fb4E51NjrVWbNC0pFUcldbpZTUGIHTFUT26rrAHbnYygtdjf0g
58Ejtw2u1VJqGrirFMzIpD6qfVsTsr0gBOnzupPdJDikkx3uf1ebkPgyOOnefIonIKcHmCnwICEZ
nKKrsmB6ddYkTbm74XiJ4ckYGJ8sCtd+sp1qcVXiNzubhdN3yPvD/HXZ2TzdCCx6R0jh08sscvqm
Wln3I6YNeE5uPAo9C4dHQQSL+H4nWmNwM8hA4jX+rXAziZih4xMKSOo5SalWEe15I1PWKmiij87e
ML8o1Gj7ehXBJobG6hOgkeKdVA5L3+ThEzBHQ+0Z1Jfx+D3IuG8Zl3BeWV21DIQqnj5X3o+JnmeS
tr2flyTqHso+YawteGbNahGrxeW6vO3uNVAKN6Hxhcu+/QlXNo+OgUmMgJJSe4dpp+D2cHVp2i37
YsyUMp99EtAhjFYIqaM9An8FYOyAMdpoo8gOdzb1wBR6aoBEkc75Ix5Zb0sdh7YjuUBaCIVDtXqu
LSksm7TmCT1eIt53bq9mUUMdLGOeKQXUSWD+h2GVEzuhhrWnIdmXZfJ82rpYNCK9x91qpT5UaNZD
thTZ/yc284Kjr3f0UKHc3QLMvU6EZM9m/5zw0tW5T++GMbn5jt0xQgiMmwnHbjn7RvFoUx0VkQn0
P3RbyIqt/Bts3bSHX7C//jh/Hn29ASZ4VXD5h8M3fm1yc1BHg7FbHAGMFqXOlM8uj/Map0Phm0Nk
fEfMv7dZsjiv9Piq1aUkbZ6h4/HAXmCNMgFxL7VGo4iSn0iz2KYCmHXZ616ZoHTM9bokEN6Sp3sZ
badXA45MYhzzbL0I9jndtlN29x9+JBwex0qXgZmLr8m9SecYBaa7Y8i6YtpQCJIfySsLiaJQgTKh
Rh4dTIdo1hcZKHrDoHnE0DP5QXse3R7WrZ1MYStcfbrP3RloZ8sBNnZJlgYTH6iK7mogLZ1uhRzM
3DMURweBdgBMEK7vp8CpFTf8/N+Oac0YdMJY2sGVAJGQ39SA21jyd//FjoC8UKmkp1b9zCeVPVUV
nT/54rqyFZIgDWChJ1n+iKmIzkETqg3C+a2jtKhDs6pMWyb1ukoLqC2QiEdAJaTRYuvWvnp4w2JF
0Z2eiiJVdugtnURTtv3bCBiPm5A68KlPuJsXFUB8k/9SwGJBlSBFIs1i6K6cuRQ09smdrxmcAHse
QvEYoJm7VIsitS/R6+xyjnoORCCUmKOGX7q9wTRhtzuCnVoF/cEurSQZT+oYKkNJ+FQUNj692FYK
66bUFhO0Q/DPsmWH+5Vn4Iwe4f65HLQmuDjCuwEIkkk7pedTlwxqrMIO6Fec2W0Vnh9JC1cqcSfD
EdTnPtTfMpH/X7OooOttaIuFT7/XWIEJcrWRhVcyt6TOWjXYlk9QxrHwVhSsyCohYFK8ON8kOox3
m306TxBgmOIW/hmbWDfh5Ptlt2Wx6ELDD3YQuIqYJKfraWaK+Gifc0agesqkq6TShJBr4/g/MpVt
STBF3D/YXxb0JyTdQRWwL4S05baguZj+9wdQ1hOR1Iz381qTKVxiHzu69v9WfIDjNAweQBSoIt6j
CAHJFOwseZe/JwU6qZt9SSSK+nVqN1j4e+E+SQinSJwOv53rOd2kdBDLF4kB6nv9XfAiy5EqRYl1
kCjEfhUKKYUJH3DuPKd17yLLsC24Te+Xl7L/G9dS6/kUtOI0FxxeGOq8DnzDfqqmIS7YvtFiaM1M
t7MkYP31nxpDBSGZrc0X0YJj892rCF2XcTbdVihAsoNb8BanleNyH4v0BGsugUtgXqRAPv/D2AWf
RE9gch6ecez1cxicFfO+2TUduwtqbe2Lky9t7hB8OQoESSezoBprw6LmkCorO6a+BI+pKpe05CK5
JsPipE3p1kjvyCA2IeDTnq1j9XAZ87rU9+qMuzf0HA5wTuWm2BYdqZ4lYoHq4/tURZlS+U0q4EeY
LLtc6DEg961TQl+e9NcCg/nGQ6nAsrNc/xOigztIHiMQCH7simZWSVNZfunMsswY2e2mPRPvjAR1
CsRVjk4DNmrrLBssfqyfz6qimtuRnmsyyxKYa+KFzH1rYVFjLa/GX2h82KAB5ev3y4sCjM5wv9SS
WJOdJ0FqwWNZJQ9kls1SEWqWaUCvR2R2gghn5CBEIiYb5Xrplpj54HXSYIIhYzor37YovY+7vzyj
6WZOMap9ji3pYx1L2HJ+mn3BqimCBSI3hhtEdJhT+lxkFF/GpvRD8FMYDTTqNRt373YYRZk8FGzo
M6EGVS39Js22qOooGeOK4LNIrvzxrJ/IL7JSVx19C5LKbp1Doxj/er7GMViMS5lYFXVZgIouvnfn
vZgw3ituHMJlPaYnFvjGdxAqDPx2PvdbKWaqOISUsIm8K4p2vI/UnW2T48lT0qw4hU7Lz0IXd00S
ZqTz7/Tjdr5xGuL3jw1NYNTdpaYcLxWd8dDVYlTsOvpMem6Ki2IHLxTUs4LxowznW1Q0aVd5ywGP
pgLi1+yUgp7cQMjkTN3zz29TBgSc/YVdDtON4NpYdmBvsmS+mWLrVxuj8H+ynlHm8Sb4MaHQp7QP
Ch2L2+bGME9XoNLtbIwrk7AQA3GOUomFS3bbK05fv4htrdSVGbi/Dt+ptnzVwPBdhknYb0/Z3ipO
TrDddVSbYwhXUXQJROKD7RquDMYxMFuadNdJ+POQoXhY8KzNAlf71vLQ6DOwS8YPqC1ikVBUnCSN
r2F3qIfgMJjCeqsTnGyIzsbMf333CYyiC4AYIlzmk5gnXTuk8YVtBDXh0TrsIaz75Vfh2KCXOLCM
PaURgjQxy6XTgM7+csh6zI3d0w3EZk4mB2AKCuIlk0zPCe7Nl6tNJRC4qEoyg5lIaNYl4wlCpzkB
9LqCyQv9WaEqFn5lIEZHpHaN+wQOT4UtHDOZJx+HEVXbpd2QwfLAgYCEUaDhp8EjG0d6nU1iO/n3
GnDNq8wtxSFU7LJTmZn1P5oKpk7u2DBB3Ki7lSgRM6v45Giyd3ucPQHbv0uhOmwCouBlDaup6h6L
JIpn1kAfDv78E1liTS3xcIbwdBqhOr7RI5LhyaKe3DMcbQfmjH1+n34XvlJb3avSFgUhjafMS4kD
YKLORUa5Mllf/sXluEsliHwvMqJKZNmVa1Aw1JUAOUoDzb4uM54DoMR0e48Nito5tUIRjPBzJDbj
6NIQvevTDTCN3fyZsRo3Jxkt731ScDW0onXLpCaN9uhEKclNrNSU3FfWLpCcJE3PHZh4ztNCyujm
/ITrXvy46gV/SlNRplRO7Gsmo4Pk/3/Ao2sg0PWHCFynxX0n6fqqaTDuDAAN50GvV9rWiqnk8hwK
Zh106s8/zVDKvo2Vh3OcXaTxOQTGjr1QhRnYBzwWWZ3zDO+7nNAlME/hy6d4bVAauHAFKoNiDAnL
9J7/aWJbrJoZDDEGlp9rLSNNP/771PmuZaPrJdnsJN9dK6XQqxOzEpA5sakUB98fRr913cbPG30h
wQdKJtYSkZEVkX7WWfdK+GuXA91wBgl0WkxH90ypjUPpNrg+9Q6meCpypVwpDqGUvqA8RuWTu7fo
ZG+8Ur5/jx5sQTe+v5Zn4ZmCph5nZ5KKjrH0W2sUk79qq1kO+BqDZidSnc6OYJmWZR2XJ6spfIbR
8nPhGEG9dYytEFVfScQLVGJApsw0WiQFrHG2vmtynFhH7/3ldXFkmG9fAOQACwgTjsuWZhuoGEC7
67+8CkyRZHpHUncU/bd01q/bmwdfYs70HqOZdJB1ITLs5nLUM8cIJpQF2cCDtSkCulpF+jwi/h8f
oep0vLvaXLqpSz5iPD8KPyeEWPc0qFaJpKzmnZeZpDPjgHFzWqvQvUNDTlup49xx/kq8G521S5l6
ZTXezpIFiV5PVsj+//UldmtWWsaBZQnl5zjkZETbpCKo+dVgfGq2WHsgZe1A/0AfQ/rooubfnXby
D7J8v3nJICA9zOqJl3DX31H3WcUhqus/G91/hc+MLLP1rBw7xk8PXYThLGvQTvdWKu0KC0vwb5+E
Y4deSCPcAxNKD1uB53vc5iVy3/ltzVfvcz2mO3EUJ7qe6WaIj3iHBlWsJukhONypo7FPyk6D0bPR
dOf4ziE5EhdNenNdAQScdXuuyVI0CRZMcyF9Lqc39rZftXhyvuPQq7hbz6nLwX/ZMd44v+1bZCWE
EP+OToiUPELI1pTjL3KnJGIqMHsJdb0pmXiTvKck+HqzRY6xsoggWHOc9Ifwa25BFHC4QIINrJap
kWMzJc/+lPnyzNDDzTBknAybyTDeaJP1uxY8vn/fy8vgkKAOST6sZxY6lJFJCP0Ox+X/zL5UsscL
qDLvjeIRNLzO1t0mGgZHbNCthYcx4W7D+e2G7Z9hTNq7gtr3xX/cuw4/1egk6TC/3H6rXIFIkDTm
5Od4vyXQka+CPvCZOx33JNMQ8Loferswg+mdQbXB4YyxvzvQ6tLr4nA/W7MZyuHDGNGtQKkuE9KD
cWnCbIUGjsDz9UcWxqGz4hG//pmpSSXWCQgEsePkzp9K0r7fSHY7isXsiCiifAczFzQelde6k3X3
03cCBbw+C4Omb720Y1/7zaM8zS9fvY602/3SjCYbW0G2JSWjN6C7IYaNEWEk0TGqt9rgIb2FsNfQ
R4Tr630DRVLNvAAbGHWmBw1bjLFB4OX96uiNrpMsR1QZbLAFD8C3Dzi4lUpCGyXdEeePr72QtZfK
HrAYMo5TF+XeBo+TbscaimbMD/kw1EoIpD8A3h/LMhAS34PwlD3+IocjgtSd5M18hzM03jDgKsTQ
rOj2lA93g/4QPsTyzZtgb4q75Etc9ITY4GGGX38kLuBrz7ZglEomr2bpEE+wsQ6NK8ivkeqDbl+4
ylCcrtQPLwGzrhuK0zTdIGju6SMYe5xQQwL271d7D6fz4ojSOcAtV919A2dKFScFfrZJ3nQPTUH7
blKErm6vhM5smoIJ/3uqyzIKUT5WEHO5EbETsOZhGqzE7kIt4RwNhEt60+Hh7F5c/N/FvjLCgxBS
7DiknE2tpki5Ryq8wajWLkLS8ID9Qtn4cohuiMxQV7K37fizp/RMTbb64M2JRZIUs+vNNR33bmsZ
th41ggb+GBf1cvNrUTooldun/xOpXQMflVflmpsd7rC0DSZgD6vt+JefzpfPTLlvMzM8NH/Db3iE
lZlQ4zfE/ZbafC1xND0dkCVtYu/cOh2HQWLQ6mPWjmAog3pQs0s72R1o9Q3iaizWsGj69U5FCFjs
dbPWRPz1ffJLF8jQDBzjwzBqCzMtzMrAUXxAxAQzKD6El1gu3W5yDa3Tu1TWKGSiy1qPG5431X1R
M5E1T/6v4mgjBEiIPlUmV5oP8zD+F88pX4BUpSkX+hzc7DH6t4xbEH9DBW+OoD1yyQMQip+0tZwH
e9gctdYQEPoQI/EisuonlrDDrLk7It0ub1qnJEmQn+sG8DxZ1G8cq9MIiQoUsp4HeVogiN7RVynK
HaokuH8DNwG2SUnV6LdHafQQyMl8Z7aJlWIk/BVqGw8aJmKC/uPijaknKksyIUFYRW9mjJuT0VkM
xh64DWX2H7yxvSmIhC0MGpYoaUBCOHS5s4AEvvHEl07VXv3lif5wjxHbIOrZmzWR/55MInt+Mz43
QUny4ZQCDWUuR5V+YWjtS8PTLkvdB04TmE5Z2e1KLnixaXlfHydIhqQHguLY75lGFSy6G9iJyYaX
FFAEMQyC/ZqSr5hewSRfqWX74ebxARf+j9wugSYfMgVSGb28KTkbR9/IDl+eOfEXTukVUiWhjuoW
vtLM/qDFVkDibut85iI9HoHbjtRD858bwrFldhlq0MKfv8gYYNMY2+jMdPwZfoKitMsLfoF8Clog
HhDOxUXz/+c7qk5XfKZ6Ot4FmMBkWxsgeFwRcg0MZUxvz1jWgUjpv4FRCsgXNP/vzRihly+S4Gmv
O30vNTc9vEreMeqD3Gvn1vRqVIIJ62T2xXUkASGQoiXOEWAgB4P4ClIxJDqKQFEnBMd+u8sNLtqP
gblfTerSye+Hqht7grB27NoyMpBPomOREjHcx53oFZc9t3Kc8z+ZwLu3YLfJFo2cvD2wK8KNyIhg
RIXzLDEmAfJX7qMO13VI/fXhvKD+T54g84sJeC9S+yg3EOEnjo249JcDc2mrS0QiiBt52lUh32OF
8HscjfihWfMnUav7JZMbqGE4CdIrn887fYw71di5idqMWi1tg63aEpiDukTWl0Xf12cRm/oQoWpt
uz75yt0Mqr0abrF+iz7ufhChZsB/bwj6dPlss/QeevFz8FJT0IY67t36AJH6SpmchhM0309Qirmo
OiR7QOOLjTBlUtjpjdkqtSinZcwOvHHSKJT0aFNZeP+NuMlRMgDvQrsKK4pP+av4C4qEYgXdw3pC
VHERhMYVGIfMZP+h9Z/FPm5dxVenG0+tdK/iu0c71Cl/jNmS9Fv+psYNn8LlLpHV2rOPLTcQ7rf3
VhxLZHCczOcAxF1yLnPzNxE5JPwGl44cbE5LH7AOlcVrihPz90jBXuH3vWfa2vKN6gJcIjrpPa1r
UU/aVX505LZ5z55TdlvZ9cJochuPqGncYfwumJNnCn/Gn2uuS3/X1LiXaKLyCPZsMG+QfnMvKVCq
ZydRqKdAGm//Oa2i6oy3NxE9HJaNNXViC+mOPsmJitw42i5hs5jIe+oOlF2IwBnxvO3gf2VmEYu/
urxt9tGYiLaNjn3YgW8O+0GSfLm1YSHw5cDOE8BRbzuwv6xNJlwnhC/vYgSSlsiU5lRqTYwrwlL9
UHS6sM6/H8gtTfP5TuopXlIA0vsK7+nVJ39sU/zG6c43LG9oGRB5n5bLs84RkUiJdZuDhkwPKWU0
s/pxJ3dK36q4/3uQZmklr9ZYSEO/VDdoJv6KLvXoq5Md4KFKMplYL9aq44NMIXEznxyGLT8/1rIs
MGBEBqOCnVzKT02VpABjCurJ6fp345PiV6IAWo4VDTCtQ+CkZEekpNSum3AL5oDECY5Blouxn5sV
9bmDYCkkI8ICCPe5NzzVrqs1pQVcqQfjwwF2hWeDS18ab5JhoHkkmH1tZROPVK9qzo1L3ozVD9Z4
ndFxqrnc+e7R49sk6uxcLBTAYinYidEVuKi0z1sLcGfD2n1viCCuPP+/iumJBcL9mBN0PUAmfoEa
+q3W/kqF/BeE6jriWZvlL2ibsbaB++bD9xMIviDHz6D/KjJ3DA1mZMyogwEDDkxJW8aSWnkg6eOp
hJEx0C5dxjipgZFkqbTFZh0f5nohkGuYMPl8codYMonLFa6MPr/Iepj/WTwDbT6uV4RjMKfYqfof
e/2aksOAZZb5rDWHrXUcykZhQPyYDQArUs4HO16PGhuv+mQ1dxrBazVmbdcIIXvXZNWkdah4gAxW
e82xQbkLNSig32AFoMGDCKvbP6ICJqPFK776qus/NYbZRfOw40ZpoWv4hxzXYSvzCynHg/8RCh2Z
vLA0HvQd2Md0IQ/xxyRgzOBIiAsQ2iP4nV3i3ELEIj5s0hYZLtkE2VrSnR4jH/fgZw23EznH5P/g
u9kz5PtlncvT9l1ALWwUs2b9TXgVFIE2/4/8xeRy749E6SqPlMtUzFIdV3Hl+jA8Wv5+Ifk+zgJH
OMu9AhaVFTYcq60TVZ+UwT/a9pq6NU137LjjOrlY6+qNPrsqF/atQV4i3cWadvVKm0z/5LYtK2jC
o8pIQcDICkrKyV2NuKUp52n9361jqfhtnenp2CqY2/qpMujGrx8JnzHcWlGJ0Iow5aRW+8vY1706
e8UhQUD1QslW4bwqy0XAyEsoc3P7GjGrknPgfXfzchmeWpvUPwjkiyp4PWjl5scZ7UPG2vpDkSNN
jwsEv8ldfj7pI7//RL/Qt3Z87LFiPe9hD6h2hMgqMV2w4mIQUFnNGxacgv7v5ZZRz+9NRbVroAEt
fPKBH+hmw9RUPXf028cqBTD9Ss5iNrEUJ+Tx89rFq2JXGj8X
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
