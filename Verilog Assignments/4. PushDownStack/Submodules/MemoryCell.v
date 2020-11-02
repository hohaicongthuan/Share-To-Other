module MemoryCell(RowSel_i, data_i, data_o, WEn_i);
	input RowSel_i, data_i, WEn_i;
	output data_o;
	
	// Internal wires declaration
	wire w1, w2;
	
	TriState tri_Inst(
		.data_i(w2),
		.oe(RowSel_i),
		.data_o(data_o)
	);
	
	and(w1, RowSel_i, WEn_i);
	
	D_Latch DLatch_Inst(
		.D(data_i),
		.E(w1),
		.Q(w2),
		.Q_N()
	);
endmodule