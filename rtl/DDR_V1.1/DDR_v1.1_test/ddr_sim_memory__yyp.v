`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/07/10 21:12:25
// Design Name: 
// Module Name: ddr_sim_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define  DDR_PHY_INI_TIME  1000

module ddr_sim_memory(
        clk,
        rst_n,

        app_rdy,
        app_wdf_rdy,

        app_en,
        app_cmd,
        app_addr,

        app_wdf_wren,
        app_wdf_data,
        app_wdf_end,

        app_rd_data_valid,
        app_rd_data,

        phy_init_done_o
    );

    //------------------------------------------------
    // Input && Output Declaration
    //------------------------------------------------
    input                clk;
    input                rst_n;
  
    output               app_rdy;
    output               app_wdf_rdy;
    
    input                app_en;
    input     [2:0]      app_cmd;
    input     [28:0]     app_addr;
    
    input                app_wdf_wren;
    input     [255:0]    app_wdf_data;
    input                app_wdf_end;
  
    output               app_rd_data_valid;
    output    [255:0]    app_rd_data;
    
    output               phy_init_done_o;
  
  
//-------------------------------------------------------
// Get Command && Distinguish read / write
//-------------------------------------------------------
    // Get Command
    reg                  app_en_r;
    wire                 memory_en;
    wire                 wr_en;
    wire                 rd_en;
    
    wire      [ 28:0]    addr;
    wire      [ 28:0]    addr_r;
    
    always @(posedge clk) begin
        if(~rst_n)
            app_en_r <= 1'b0;
        else
            app_en_r <= app_en;
    end
    
    assign  memory_en = app_en | app_en_r;
    
    // Distinguish Read / Write
    assign  wr_en = (app_cmd == 3'b000) & memory_en;
    assign  rd_en = (app_cmd == 3'b001) & memory_en;
    
    // Get address
    assign  addr_r = {2'b0, app_addr>>2};
    assign  addr   = app_en?  addr_r : (app_en_r? (addr_r + 29'd1) : addr);


    input                app_wdf_wren;
    input     [255:0]    app_wdf_data;
    input                app_wdf_end;
    
    // Get write data
    reg    [255:0]       data_i_r;
    
    always@(posedge clk) begin
        data_i_r <= app_wdf_data;
    end
    
//-------------------------------------------------------
// memory: 4GB
//-------------------------------------------------------
    reg    [255:0]    ddr_sim_memory[0:134217727];

    /*  initial begin
    $readmemb("../sim_data/src_data_1.dat",ddr_sim_memory,16835208,16841351);
    end

    initial begin
    $readmemb("../sim_data/src_data_2.dat",ddr_sim_memory,18936456,18942599);
    end

    initial begin
    $readmemb("../sim_data/src_data_3.dat",ddr_sim_memory,49800,55943);
    end */

    // Write operation
    
    always@(posedge clk) begin
        if(wr_en)
            ddr_sim_memory[addr] <= data_i_r;
    end
    
    // Read operation
    reg    [255:0]    data_o_r;
    reg               data_valid_r;
    
    always@(posedge clk) begin
        if(rd_en)
            data_o_r <= ddr_sim_memory[addr];
        else
            data_o_r <= {256{1'b0}};
    end
    
    always @(posedge clk) begin
        if(~rst_n)
            data_valid_r <= 1'b0;
        else
            data_valid_r <= rd_en;
    end
  
//------------------------------------------------------
// generate phy_init_done signal
//------------------------------------------------------
    reg                  phy_init_done_r;
    reg       [ 31:0]    time_cnt;

    always @(posedge clk) begin
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
  
//------------------------------------------------------
// output 
//------------------------------------------------------
    assign  app_rdy         = 1'b1;
    assign  app_wdf_rdy     = 1'b1;
    
    assign  app_rd_data_valid  = data_valid_r;
    assign  app_rd_data        = data_o_r;

    assign  phy_init_done_o = phy_init_done_r;
  
  
endmodule
