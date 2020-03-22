module i2c_eeprom_top(clk,reset_n,wdata_in,rdata,i2c_scl,i2c_sda,
			i2c_write_req,i2c_read_req,i2c_write_ack,i2c_read_ack,wr_dev_addr,wr_reg_addr,rd_dev_addr,rd_reg_addr);
input      clk;
input      reset_n;
input [7:0]wdata_in;
output[7:0]rdata;
output     i2c_scl;
inout      i2c_sda;
input      i2c_write_req;
input      i2c_read_req ;
output     i2c_write_ack;
output     i2c_read_ack ;
input [7:0]wr_dev_addr;
input [7:0]wr_reg_addr;
input [7:0]rd_dev_addr;
input [7:0]rd_reg_addr;

wire       i2c_sda_en;


master master0(
 .clk             (clk             ),
 .reset_n         (reset_n         ),
 .i2c_scl_o       (i2c_scl         ),
 .i2c_sda         (i2c_sda         ),
 .i2c_sda_en      (i2c_sda_en      ),
 .i2c_write_req   (i2c_write_req   ),
 .i2c_read_req    (i2c_read_req    ),
 .i2c_write_ack   (i2c_write_ack   ),
 .i2c_read_ack    (i2c_read_ack    ),
 .wr_dev_addr     (wr_dev_addr[7:0]),
 .wr_reg_addr     (wr_reg_addr[7:0]),
 .wdata_in        (wdata_in   [7:0]),
 .rd_dev_addr     (rd_dev_addr[7:0]),
 .rd_reg_addr     (rd_reg_addr[7:0]),
 .rdata           (rdata[7:0]      )
);

slaver slaver0(
 .clk             (clk           ),
 .reset_n         (reset_n       ),
 .eeprom_scl_i    (i2c_scl       ),
 .eeprom_sda      (i2c_sda       ),
 .i2c_sda_en      (i2c_sda_en    ),
 .i2c_write_req   (i2c_write_req ),
 .i2c_read_req    (i2c_read_req  )
);



endmodule
