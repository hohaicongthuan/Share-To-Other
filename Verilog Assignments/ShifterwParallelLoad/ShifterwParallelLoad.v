`timescale 1ns/10ps

module ShifterwParallelLoad(data_i, data_L, data_R, S_i, Y_o, clk);
	input [7:0] data_i;
	input [1:0] S_i;
	input data_L, data_R, clk;
	output [7:0] Y_o;
		
	// Internal wires
	wire [7:0] Selector_Out;

	DFlipFlop DFF_Inst[7:0](
		.Q(Y_o[7:0]),
		.Q_N(),
		.D(Selector_Out[7:0]),
		.clk(clk)
	);

	Mux4_1 Selector_Inst[7:0] (
		.data_o(Selector_Out[7:0]),
		.dataA_i(Y_o[7:0]),
		.dataB_i(data_i[7:0]),
		.dataC_i({Y_o[6:0], data_R}),
		.dataD_i({data_L, Y_o[7:1]}),
		.select1_i(S_i[0]),
		.select2_i(S_i[1])
	);
	
endmodule