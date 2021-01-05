module ShifterwParallelLoad(data_i, data_L, data_R, S_i, Y_o, Clk, Rst_N);
	parameter BUSWIDTH = 8;
	
	input [BUSWIDTH - 1:0] data_i;
	input [1:0] S_i;
	input data_L, data_R, Clk, Rst_N;
	output [BUSWIDTH - 1:0] Y_o;
		
	// Internal wires
	wire [BUSWIDTH - 1:0] Selector_Out;

	DFlipFlop DFF_Inst[BUSWIDTH - 1:0](
		.Q(Y_o[BUSWIDTH - 1:0]),
		.QN(),
		.D(Selector_Out[BUSWIDTH - 1:0]),
		.Clk(Clk),
		.PreN(1'b1),
		.ClrN(Rst_N)
	);

	Mux4_1 Selector_Inst[BUSWIDTH - 1:0] (
		.data_o(Selector_Out[BUSWIDTH - 1:0]),
		.dataA_i(Y_o[BUSWIDTH - 1:0]),
		.dataB_i(data_i[BUSWIDTH - 1:0]),
		.dataC_i({Y_o[BUSWIDTH - 2:0], data_R}),
		.dataD_i({data_L, Y_o[BUSWIDTH - 1:1]}),
		.select1_i(S_i[0]),
		.select2_i(S_i[1])
	);
	
endmodule