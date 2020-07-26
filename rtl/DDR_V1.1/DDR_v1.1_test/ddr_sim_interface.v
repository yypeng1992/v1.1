`timescale 1ns / 1ps

`define  DDR_PHY_INI_TIME  1000

module ddr_sim_interface(

  clk,
  rst_n,
  
//***************** read **************
  raddr_fifo_rd_en,
  raddr_fifo_dout,
  raddr_fifo_valid,
  raddr_fifo_empty,
  
  rdata_fifo_din,
  rdata_fifo_wr_en,
//***********************************//
  
//**************** write **************
  waddr_fifo_rd_en,
  waddr_fifo_dout,
  waddr_fifo_empty,
  waddr_fifo_valid,
  
  wdata_fifo_rd_en,
  wdata_fifo_dout,
  wdata_fifo_valid,
  wdata_fifo_empty,
  wdata_fifo_rdepth,
//***********************************//
  
  phy_init_done
  
);

//***************************************************
// Input && Output Declaration
//***************************************************
    input               clk;
    input               rst_n;

    
    output              raddr_fifo_rd_en;
    input    [29:0]     raddr_fifo_dout;
    input               raddr_fifo_empty;
    input               raddr_fifo_valid;

    output   [255:0]    rdata_fifo_din;
    output              rdata_fifo_wr_en;

    
    output              waddr_fifo_rd_en;
    input    [29:0]     waddr_fifo_dout;
    input               waddr_fifo_empty;
    input               waddr_fifo_valid;

    output              wdata_fifo_rd_en;
    input    [255:0]    wdata_fifo_dout;
    input               wdata_fifo_empty;
    input               wdata_fifo_valid;
    input    [ 8:0]     wdata_fifo_rdepth;

    output              phy_init_done;
    
//-------------------------------------------------------
// Get data to be wrote
//-------------------------------------------------------
  

//-------------------------------------------------------
// memory: 4GB
//-------------------------------------------------------
  reg    [255:0]    ddr_sim_memory[0:134217727];
  
  //如果你想初始化数据，请修改此处
 /*  initial begin
    $readmemb("../sim_data/src_data_1.dat",ddr_sim_memory,16835208,16841351);
  end
  
  initial begin
    $readmemb("../sim_data/src_data_2.dat",ddr_sim_memory,18936456,18942599);
  end
  
 initial begin
    $readmemb("../sim_data/src_data_3.dat",ddr_sim_memory,49800,55943);
  end */


//------------------------------------------------------
// Write Operation
//------------------------------------------------------

    reg     waddr_fifo_rd_en_r;
        
    assign  waddr_fifo_rd_en = ~waddr_fifo_empty & ~waddr_fifo_valid & (|(wdata_fifo_rdepth>>1));

    assign  wdata_fifo_rd_en = waddr_fifo_rd_en | waddr_fifo_rd_en_r;

    always@(posedge clk) begin
       if(~rst_n)
           waddr_fifo_rd_en_r <= 1'b0;
       else
           waddr_fifo_rd_en_r <= waddr_fifo_rd_en;
    end
    
    wire                 write_en;
    wire      [255:0]    write_data;
    wire      [28:0]     write_addr_r;
    wire      [28:0]     write_addr;
    

    assign   write_en   = wdata_fifo_valid;
    
    assign   write_data = wdata_fifo_dout;
    
    assign   write_addr_r = {2'b0, waddr_fifo_dout[28:0]>>2};
    
    assign   write_addr   = waddr_fifo_valid ? write_addr_r :
                           (wdata_fifo_valid ? write_addr_r + 29'd1 : write_addr_r);
    
    always@(posedge clk) begin
       if(write_en)
          ddr_sim_memory[write_addr] <= write_data;
    end


//------------------------------------------------------
// Read Operation
//------------------------------------------------------
 
    assign  raddr_fifo_rd_en = ~raddr_fifo_empty & ~raddr_fifo_valid;
    
    reg     raddr_fifo_valid_r;
    
    always@(posedge clk) begin
       if(~rst_n)
          raddr_fifo_valid_r <= 1'b0;
       else
          raddr_fifo_valid_r <= raddr_fifo_valid;
    end
    
    wire               read_en;
    wire    [28:0 ]    read_addr_r;
    wire    [28:0 ]    read_addr;
    reg     [255:0]    read_data;
    reg                read_data_valid;
    
    assign  read_en  = raddr_fifo_valid | raddr_fifo_valid_r;
    
    assign  read_addr_r = {2'b0, raddr_fifo_dout[28:0]>>2};
    
    assign  read_addr   = raddr_fifo_valid ? read_addr_r : 
                          (raddr_fifo_valid_r ? read_addr_r + 29'd1 : read_addr_r);
    
    always@(posedge clk) begin
        if(read_en)
           read_data <= ddr_sim_memory[read_addr];
        else
           //read_data <= $random;
           read_data <= {256{1'b0}};
    end
    
    always@(posedge clk) begin
        if(~rst_n)
            read_data_valid <= 1'b0;
        else
            read_data_valid <= read_en;
    end
    
    assign rdata_fifo_din = read_data;
    
    assign rdata_fifo_wr_en = read_data_valid;
  
//------------------------------------------------------
// generate phy_init_done signal
//------------------------------------------------------
    
    reg   [31:0]    time_cnt;
    reg             phy_init_done_r;
    
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n)
          time_cnt <= 32'd0;
        else if(time_cnt == `DDR_PHY_INI_TIME)
          time_cnt <= `DDR_PHY_INI_TIME;
        else
          time_cnt <= time_cnt + 32'd1;
    end

    always @(posedge clk) begin
        if(~rst_n)
          phy_init_done_r <= 1'b0;
        else if(time_cnt == `DDR_PHY_INI_TIME)
          phy_init_done_r <= 1'b1;
        else 
          phy_init_done_r <= phy_init_done_r;
    end
    
    assign phy_init_done = phy_init_done_r;
    
endmodule