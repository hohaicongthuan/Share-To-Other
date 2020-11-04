module RAM(data_i, data_o, addr_i, WEn_i);
	parameter DATAWIDTH = 8;
	
	input [DATAWIDTH - 1:0] data_i;
	input [9:0] addr_i;
	input WEn_i;
	output [DATAWIDTH - 1:0] data_o;
	
	// Internal wires
	wire [1023:0] w1;
	
	word word_Inst[1023:0](
		.RowSel_i(w1[1023:0]),
		.data_i(data_i[DATAWIDTH - 1:0]),
		.data_o(data_o[DATAWIDTH - 1:0]),
		.WEn_i(WEn_i)
	);
	
	Decoder10to1024 D10to1024_Inst(
		.data_i(addr_i[9:0]),
		.data_o(w1[1023:0]),
		.e_i(1'b1)
	);
endmodule