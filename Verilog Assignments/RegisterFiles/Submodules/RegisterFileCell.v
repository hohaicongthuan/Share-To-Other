module RegisterFileCell(WriteSelect, data_i, Clk, OutA, OutB, ReadA, ReadB);
	input WriteSelect, data_i, Clk, ReadA, ReadB;
	output OutA, OutB;
	
	wire w1, w2, w3, WriteSelectN, DFF_Out;
	
	not(WriteSelectN, WriteSelect);
	and(w1, DFF_Out, WriteSelectN);
	and(w2, data_i, WriteSelect);
	or(w3, w1, w2);
	
	DFlipFlop DFF_Inst(
		.Q(DFF_Out),
		.Q_N(),
		.D(w3),
		.clk(Clk)
	);
	
	TriState TriA(
		.data_i(DFF_Out),
		.oe(ReadA),
		.data_o(OutA)
	);
	
	TriState TriB(
		.data_i(DFF_Out),
		.oe(ReadB),
		.data_o(OutB)
	);
endmodule