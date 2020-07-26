module crc8(
    input clk,
    input rst_n,
    input data, /// serial input, 32-bit in total, bit by bit
    input data_valid,
    input crc_start,
    output crc_out,
    output reg crc_valid
);

/*
 * G(D) = D8 + D2 + D + 1
 */

reg [4:0] count;
reg [7:0] byte;
wire      crc_done;

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        count[4:0] <= 5'd0;
    end else if(data_valid) begin
        count[4:0] <= count[4:0] + 5'd1;
    end else if(crc_start) begin
        count[4:0] <= 5'd0;
    end else if(crc_valid) begin
        count[4:0] <= crc_done ? 5'd0 : count[4:0] + 5'd1;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        byte[7:0] <= 8'hff;
    end else if(data_valid) begin
        byte[7:0] <= CRC8(byte[7:0]);
    end else if(crc_valid) begin
        byte[7:0] <= {byte[6:0], 1'b1};
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        crc_valid <= 1'b0;
    end else if(crc_start) begin
        crc_valid <= 1'b1;
    end else if(crc_done) begin
        crc_valid <= 1'b0;
    end
end
assign crc_out  = byte[7];
assign crc_done = crc_valid && (count[2:0]==3'h7);

function [7:0] CRC8(input [7:0] byte_in, input bit_in);
    reg [7:0] crc8_mask;
    begin
        crc8_mask[7:0]= (byte_in[7] ^ bit_in) ? 8'h07 : 8'h00;
        CRC8[7:0] = {byte_in[6:0], 1'b0} ^ crc8_mask[7:0];
        /*
        等效写法
        CRC8[7] = byte_in[6];
        CRC8[6] = byte_in[5];
        CRC8[5] = byte_in[4];
        CRC8[4] = byte_in[3];
        CRC8[3] = byte_in[2];
        CRC8[2] = byte_in[1] ^ byte_in[7] ^ bit_in;
        CRC8[1] = byte_in[0] ^ byte_in[7] ^ bit_in;
        CRC8[0] =              byte_in[7] ^ bit_in;
        */
    end
endfunction

endmodule
