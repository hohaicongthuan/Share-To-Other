module RAM(data_i, data_o, addr_i, WEn_i, OutEn);
	input [7:0] data_i;
	input [9:0] addr_i;
	input WEn_i, OutEn;
	output [7:0] data_o;
	
	// Internal wires
	wire [1023:0] w1;
	wire [7:0] RAM_Output;
	
	word word_Inst[1023:0](
		.RowSel_i(w1[1023:0]),
		.data_i(data_i[7:0]),
		.data_o(RAM_Output[7:0]),
		.WEn_i(WEn_i)
	);
	
	Decoder10to1024 D10to1024_Inst(
		.data_i(addr_i[9:0]),
		.data_o(w1[1023:0]),
		.e_i(1'b1)
	);
	
	TriState Tri_Inst [7:0](
		.data_i(RAM_Output[7:0]),
		.oe(OutEn),
		.data_o(data_o[7:0])
	);
endmodule