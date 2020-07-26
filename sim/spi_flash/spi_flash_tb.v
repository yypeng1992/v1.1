module spi_flash_tb();
reg clk;
reg reset_n;
reg key;


wire [5:0]sel;
wire [7:0]seg;
wire      w_pin;
wire      dclk;
wire      ncs;
wire      r_pin;

//defparam spi_flash_tb.memory.mem_access.initfile = "~/tree/v1.1/rtl/M25P16_VG_V12/initmemory.txt"; // modified by YYP at 2020-06-06
defparam spi_flash_tb.memory.mem_access.initfile = "initmemory.txt"; // modified by YYP at 2020-06-07

`ifdef SIM_SPI_FLASH
initial begin
        clk = 1'b0;
        forever #20 clk = ~clk;
end

initial begin
        reset_n = 1'b0;
        #38 reset_n = 1'b1;
        $display("%t @@@ start!",$realtime);
        #200000000;
        $display("%t @@@ finish!",$realtime);
        $finish;
end

initial begin
            key = 1'b1;
        #13470 key = 1'b0;
        #15 key = 1'b1;
        #1025 key = 1'b0;
        #2300 key = 1'b1;
        
end 


//initial begin
//      r_pin = 1'b0;
//      forever #70 r_pin = ~r_pin;
//end


initial begin
        $fsdbDumpfile("flash.fsdb");
        $fsdbDumpvars(0,spi_flash_tb);
	$fsdbDumpMDA();
end

`endif

spi_flash_test test0(
 .clk            (clk           ),
 .reset_n        (reset_n       ),
 .key_in         (key           ),
 .sel            (sel[5:0]      ),
 .seg            (seg[7:0]      ),
 .w_pin          (w_pin         ),
 .dclk           (dclk          ),
 .ncs            (ncs           ),
 .r_pin          (r_pin         )
);

m25p16 memory (
 .c       (dclk  ), 
 .data_in (w_pin ), 
 .s       (ncs   ),
 .w       (1'b1  ),
 .hold    (1'b1  ),
 .data_out(r_pin )
); 


endmodule
