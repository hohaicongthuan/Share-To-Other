module RAM(data_i, data_o, addr_i, WEn_i);
	input [7:0] data_i;
	input [9:0] addr_i;
	input WEn_i;
	output [7:0] data_o;
	
	// Internal wires
	
	word word_Inst[1023:0](
		.RowSel_i(),
		.data_i(),
		.data_o(),
		.WEn_i()
	);
	
	Decoder10to1024 D10to1024_Inst(
		.data_i(),
		.data_o(),
		.e_i()
	);
endmodule