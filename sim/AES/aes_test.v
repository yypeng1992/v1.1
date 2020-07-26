module aes_test();
reg      clk;
reg      reset_n;
reg [2:0]mode;
reg start;
reg [127:0]text_in;
reg [255:0]key;
wire done;
wire [127:0]text_out;
reg [127:0]buffer;

`ifdef SIM_AES

initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end

initial begin
	reset_n = 1'b0;
	#45 reset_n = 1'b1;
	#2000000 $finish;
end

initial begin
end

initial begin
	
end

initial begin
	start = 1'b0;
	mode[2:0] = 3'd0;
	key[127:0] = 128'd0;
	text_in[127:0] = 128'd0;
	#190;

	/// AES-EN trigger
	@(posedge clk) #0.1;
	start = 1'b1;
	mode[2:0]=3'd0;
	key[255:0] = 256'h00_01_02_03_04_05_06_07_08_09_0a_0b_0c_0d_0e_0f;
	text_in[127:0] = 128'h00_11_22_33_44_55_66_77_88_99_aa_bb_cc_dd_ee_ff;

	@(posedge clk) #0.1;
	start = 1'b0;
	mode[2:0]=3'dx;
	key[255:0] = 256'hx;
	text_in[127:0] = 128'hx;
	wait(done);
	repeat(2) @(posedge clk);
	start = 1'b1;
	mode[2:0]=3'd1;
	key[255:0] = 256'h00_01_02_03_04_05_06_07_08_09_0a_0b_0c_0d_0e_0f;
	text_in[127:0] = buffer[127:0];

	@(posedge clk) #0.1;
	start = 1'b0;
	mode[2:0]=3'dx;
	key[255:0] = 256'hx;
	text_in[127:0] = 128'hx;
	wait(done);

end


initial begin
	$fsdbDumpfile("aes.fsdb");
	$fsdbDumpvars(0,aes_test);
end

`endif

aes aes0(
.clk     (clk     ),
.reset_n (reset_n ),
.mode_in (mode    ),
.start   (start   ),
.text_in (text_in ),
.key_in  (key     ),
.done    (done    ),
.text_out(text_out)
);

always@(posedge clk or negedge reset_n)
begin
	if(!reset_n)
		buffer[127:0] <= 128'h0;
	else if(done)
		buffer[127:0] <= text_out[127:0];
end

endmodule



