// An array of memory cells (a word).
// The number of bits is defined in parameter below

module word(RowSel_i, data_i, data_o, WEn_i);
	// Define how big is a word here
	parameter BUSWIDTH = 8;
	
	input RowSel_i, WEn_i;
	input [BUSWIDTH - 1:0] data_i;
	output [BUSWIDTH - 1:0] data_o;
	
	MemoryCell MC_Inst[BUSWIDTH - 1:0](
		.RowSel_i(RowSel_i),
		.data_i(data_i[BUSWIDTH - 1:0]),
		.data_o(data_o[BUSWIDTH - 1:0]),
		.WEn_i(WEn_i)
	);

endmodule