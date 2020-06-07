module mem(reset_n,ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo,
	   mem_we,mem_waddr,mem_wdata,mem_whilo,mem_hi,mem_lo,
	   ex_cnt,ex_hilo_tempt,ex_minuend,mem_cnt,mem_hilo_tempt,mem_minuend,
	   aluop_i,load_store_addr,load_store_data,data_from_mem,ce,we,sel,mem_addr,mem_data,
	   LLbit_i,wb_LLbit_we,wb_LLbit_value,LLbit_we_o,LLbit_value_o);
input            reset_n;

/////////////////////////////
////input from ex
/////////////////////////////
input            ex_we;
input      [4:0] ex_waddr;
input      [31:0]ex_wdata;
input            ex_whilo;
input      [31:0] ex_hi;
input      [31:0] ex_lo;

/////////////////////////////
////output to mem
/////////////////////////////
output reg       mem_we;
output reg [4:0] mem_waddr;
output reg [31:0]mem_wdata;
output reg       mem_whilo;
output reg [31:0] mem_hi;
output reg [31:0]mem_lo;


/////////////////////////////
////input and output with ctrl
/////////////////////////////
input      [5 :0]ex_cnt;
input      [63:0]ex_hilo_tempt;
input      [63:0]ex_minuend;
output reg [5 :0]mem_cnt;
output reg [63:0]mem_hilo_tempt;
output reg [63:0]mem_minuend;


/////////////////////////////////////////////
////input and output with load_store
/////////////////////////////////////////
input      [7 :0]aluop_i;
input      [31:0]load_store_addr;
input      [31:0]load_store_data;
input      [31:0]data_from_mem;
output reg       ce;
output reg       we;
output reg [3 :0]sel;
output reg [31:0]mem_addr;
output reg [31:0]mem_data;


/////////////////////////////////////////////
////input and output with load_store ll sc
/////////////////////////////////////////
input           LLbit_i;
input           wb_LLbit_we;
input           wb_LLbit_value;
output reg      LLbit_we_o;
output reg      LLbit_value_o;

wire  LLbit_in;
assign LLbit_in = wb_LLbit_we ? wb_LLbit_value : LLbit_i;

always @ (*) begin
	if(!reset_n ) begin
		mem_we              =  1'b0;
		mem_waddr   [4:0]   =  {5{1'b0}};
		mem_wdata   [31:0]  =  {32{1'b0}};
		mem_whilo           =  1'b0;
		mem_hi   [31:0]     =  {32{1'b0}};
		mem_lo   [31:0]     =  {32{1'b0}};
		mem_cnt      [5:0 ] =   {6{1'b0}};
		mem_hilo_tempt[63:0] =   {64{1'b0}};
		mem_minuend[63:0]   = {64{1'b0}};
		ce                  = 1'b0;
		we                  = 1'b0;
		sel [3:0]           = 4'b1111;
		mem_addr[31:0]      = {32{1'b0}};
		mem_data[31:0]      = {32{1'b0}};
		LLbit_we_o          = 1'b0;
		LLbit_value_o       = 1'b0;
	end else  begin
		mem_we              =  ex_we;
		mem_waddr   [4:0]   =  ex_waddr[4:0];
		mem_wdata   [31:0]  =  ex_wdata[31:0];
		mem_whilo           =  ex_whilo;
		mem_hi   [31:0]     =  ex_hi[31:0];
		mem_lo   [31:0]     =  ex_lo[31:0];
		mem_cnt      [5:0 ] =  ex_cnt      [5:0];
		mem_hilo_tempt[63:0] =  ex_hilo_tempt[63:0];
		mem_minuend[63:0] = ex_minuend[63:0];
		LLbit_we_o          = 1'b0;
		LLbit_value_o       = 1'b0;
		case(aluop_i)
			/////////////////////////////////////
			/////lb
			/////////////////////////////////////
			8'b00100000:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0111;
						mem_wdata[31:0] = {{24{data_from_mem[31]}}, data_from_mem[31:24]};
					end
					2'b01:begin
						sel      [3 :0] = 4'b1011;
						mem_wdata[31:0] = {{24{data_from_mem[23]}},data_from_mem[23:16]};
					end
					2'b10:begin
						sel      [3 :0] = 4'b1101;
						mem_wdata[31:0] = {{24{data_from_mem[15]}},data_from_mem[15:8]};
					end
					2'b11:begin
						sel      [3 :0] = 4'b1110;
						mem_wdata[31:0] = {{24{data_from_mem[7]}},data_from_mem[7:0]};
					end
				endcase
			end
			/////////////////////////////////////
			/////lbu
			/////////////////////////////////////
			8'b00100100:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0111;
						mem_wdata[31:0] = { data_from_mem[31:24]};
					end
					2'b01:begin
						sel      [3 :0] = 4'b1011;
						mem_wdata[31:0] = {data_from_mem[23:16]};
					end
					2'b10:begin
						sel      [3 :0] = 4'b1101;
						mem_wdata[31:0] = {data_from_mem[15:8]};
					end
					2'b11:begin
						sel      [3 :0] = 4'b1110;
						mem_wdata[31:0] = {data_from_mem[7:0]};
					end
				endcase
			end
			/////////////////////////////////////
			/////lh
			/////////////////////////////////////
			8'b00100001:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0011;
						mem_wdata[31:0] = {{24{data_from_mem[31]}},data_from_mem[31:16]};
					end
					2'b10:begin
						sel      [3 :0] = 4'b1100;
						mem_wdata[31:0] = {{24{data_from_mem[15]}},data_from_mem[15:0]};
					end
					default:begin
						sel      [3 :0] = 4'b1111;
						mem_wdata[31:0] = {32{1'b0}};
					end
				endcase
			end
			/////////////////////////////////////
			/////lhu
			/////////////////////////////////////
			8'b00100101:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0011;
						mem_wdata[31:0] = {data_from_mem[31:16]};
					end
					2'b10:begin
						sel      [3 :0] = 4'b1100;
						mem_wdata[31:0] = {data_from_mem[15:0]};
					end
					default:begin
						sel      [3 :0] = 4'b1111;
						mem_wdata[31:0] = {32{1'b0}};
					end
				endcase
			end
			/////////////////////////////////////
			/////lw
			/////////////////////////////////////
			8'b00100011:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0000;
						mem_wdata[31:0] = {{24{data_from_mem[31]}},data_from_mem[31:0]};
					end
					default:begin
						sel      [3 :0] = 4'b1111;
						mem_wdata[31:0] = {32{1'b0}};
					end
				endcase
			end
			/////////////////////////////////////
			/////sb
			/////////////////////////////////////
			8'b00101000:begin
				ce                  = 1'b1;
				we                  = 1'b1;
				mem_addr[31:0]      = load_store_addr[31:0];
				mem_data[31:0]      = {load_store_data[7:0],load_store_data[7:0],load_store_data[7:0],load_store_data[7:0]};
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0111;
					end
					2'b01:begin
						sel      [3 :0] = 4'b1011;
					end
					2'b10:begin
						sel      [3 :0] = 4'b1101;
					end
					2'b11:begin
						sel      [3 :0] = 4'b1110;
					end
				endcase
			end
			/////////////////////////////////////
			/////sh
			/////////////////////////////////////
			8'b00101001:begin
				ce                  = 1'b1;
				we                  = 1'b1;
				mem_addr[31:0]      = load_store_addr[31:0];
				mem_data[31:0]      = {load_store_data[15:0],load_store_data[15:0]};
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0011;
					end
					2'b10:begin
						sel      [3 :0] = 4'b1100;
					end
					default:begin
						sel      [3 :0]  = 4'b1111;
					end
				endcase
			end
			/////////////////////////////////////
			/////sw
			/////////////////////////////////////
			8'b00101011:begin
				ce                  = 1'b1;
				we                  = 1'b1;
				mem_addr[31:0]      = load_store_addr[31:0];
				mem_data[31:0]      = {load_store_data[31:0]};
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0000;
					end
					default:begin
						sel      [3 :0]  = 4'b1111;
					end
				endcase
			end
			/////////////////////////////////////
			/////lwl
			/////////////////////////////////////
			8'b00100010:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0000;
						mem_wdata[31:0] = data_from_mem[31:0];
					end
					2'b01:begin
						sel      [3 :0] = 4'b0001;
						mem_wdata[31:0] = {data_from_mem[23:0],load_store_data[7:0]};
					end
					2'b10:begin
						sel      [3 :0] = 4'b0011;
						mem_wdata[31:0] = {data_from_mem[15:0],load_store_data[15:0]};
					end
					2'b11:begin
						sel      [3 :0] = 4'b0111;
						mem_wdata[31:0] = {data_from_mem[7:0],load_store_data[23:0]};
					end
				endcase
			end
			/////////////////////////////////////
			/////lwr
			/////////////////////////////////////
			8'b00100110:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b1110;
						mem_wdata[31:0] = {load_store_data[31:8],data_from_mem[31:24]};
					end
					2'b01:begin
						sel      [3 :0] = 4'b1100;
						mem_wdata[31:0] = {load_store_data[31:16],data_from_mem[31:16]};
					end
					2'b10:begin
						sel      [3 :0] = 4'b1000;
						mem_wdata[31:0] = {load_store_data[31:24],data_from_mem[31:8]};
					end
					2'b11:begin
						sel      [3 :0] = 4'b0000;
						mem_wdata[31:0] = data_from_mem[31:0];
					end
				endcase
			end
			/////////////////////////////////////
			/////swl
			/////////////////////////////////////
			8'b00101010:begin
				ce                  = 1'b1;
				we                  = 1'b1;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0000;
						mem_data [31:0] = load_store_data[31:0];
					end
					2'b01:begin
						sel      [3 :0] = 4'b1000;
						mem_data [23:0] = load_store_data[31:8];
					end
					2'b10:begin
						sel      [3 :0] = 4'b1100;
						mem_data [15:0] = load_store_data[31:16];
					end
					2'b11:begin
						sel      [3 :0] = 4'b1110;
						mem_data [7:0] = load_store_data[31:24];
					end
				endcase
			end
			/////////////////////////////////////
			/////swr
			/////////////////////////////////////
			8'b00101110:begin
				ce                  = 1'b1;
				we                  = 1'b1;
				mem_addr[31:0]      = load_store_addr[31:0];
				case(mem_addr[1:0])
					2'b00:begin
						sel      [3 :0] = 4'b0111;
						mem_data [31:24] = load_store_data[7:0];
					end
					2'b01:begin
						sel      [3 :0] = 4'b0011;
						mem_data [31:16] = load_store_data[15:0];
					end
					2'b10:begin
						sel      [3 :0] = 4'b0001;
						mem_data [31:8] = load_store_data[23:0];
					end
					2'b11:begin
						sel      [3 :0] = 4'b0000;
						mem_data [31:0] = load_store_data[31:0];
					end
				endcase
			end
			/////////////////////////////////////
			/////ll
			/////////////////////////////////////
			8'h30:begin
				ce                  = 1'b1;
				we                  = 1'b0;
				mem_addr[31:0]      = load_store_addr[31:0];
				LLbit_we_o          = 1'b1;
				LLbit_value_o       = 1'b1;
				sel      [3 :0] = 4'b0000;
				mem_wdata[31:0] = data_from_mem[31:0];
				
			end
			/////////////////////////////////////
			/////sc
			/////////////////////////////////////
			8'h38:begin
				if(LLbit_in)begin
					ce                  = 1'b1;
					we                  = 1'b1;
					sel [3:0]           = 4'b0000;
					mem_addr[31:0]      = load_store_addr[31:0];
					mem_data[31:0]      = load_store_data[31:0];
					LLbit_we_o          = 1'b1;
					LLbit_value_o       = 1'b0;
					mem_wdata[31:0]     = 1'b1;
				end else begin
					ce                  = 1'b0;
					LLbit_we_o          = 1'b0;
					LLbit_value_o       = 1'b0;
					mem_wdata[31:0]     = 1'b0;
				end
			end

			default:begin
				ce                  = 1'b0;
				we                  = 1'b0;
				sel [3:0]           = 4'b1111;
				mem_addr[31:0]      = {32{1'b0}};
				mem_data[31:0]      = {32{1'b0}};
			end

		endcase
	end
end


endmodule
