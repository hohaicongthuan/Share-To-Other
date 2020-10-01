// chay theo xung clock dem mssv
/*module lab01_18521522(clk, count_o);
	input clk;
	output [3:0] count_o;
	
	wire clk;
	wire [3:0] data_o;
	
	// declare internal signal
	wire [2:0] incr_t; 
	wire [2:0] state_t;
	
	register register_inst0(
	.clk(clk),
	.data_i(incr_t),
	.data_o(state_t)
	);
	
	increment increment_inst0(
	.data_i(state_t),
	.data_o(incr_t)
	);
	
	transfer transfer_inst0(
	.data_i(state_t),
	.data_o(count_o)
	);
endmodule*/


// co nap gia tri, khi load = 1 thi output = gia tri nap
module lab01_18521522(clk, load_i, value_i, count_o);
	input clk;
	input load_i;
	input [3:0] value_i;
	// input [2:0] data_i;
	output [3:0] count_o;
	
	wire clk;
	wire load_i;
	wire [3:0] value_i ;
	wire [3:0] count_o;
	
	// declare internal signal
	wire [2:0] incr_t; 
	wire [2:0] state_t;
	
	register register_inst0(
	.clk(clk),
	.value_i(value_i),
	.load_i(load_i),
	.data_i(incr_t),
	.data_o(state_t)
	);
	
	increment increment_inst0(
	.data_i(state_t),
	.data_o(incr_t)
	);
	
	transfer transfer_inst0(
	.data_i(state_t),
	.data_o(count_o)
	);
endmodule