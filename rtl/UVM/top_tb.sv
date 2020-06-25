`timescale 1ns/1ps
`include "uvm_macros.svh"

import uvm_pkg::*;
`include "my_driver.sv"

module top_tb;
reg       clk;
reg       reset_n;
reg  [7:0]rxd;
reg       rx_dv;
wire [7:0]txd;
wire      tx_en;

initial begin
	clk = 1'b0;
	forever #100 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#1000 reset_n = 1'b1;
end

initial begin
	uvm_config_db#(virtual my_if)::set(null, "uvm_test_toop", "vif", input_if);
end

my_if input_if(clk, reset_n);
my_if output_if(clk, reset_n);

dut my_dut(
.clk      (clk           ),
.reset_n  (reset_n       ),
.rxd      (input_if.data ),
.rx_dv    (input_id.valid),
.txd      (output_if.data),
.tx_en    (output_if.valid)
);

initial begin
	run_test("my_driver");
end

endmodule
