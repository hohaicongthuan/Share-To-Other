// Half Adder Subtractor

module HAS(A, B, D, Out, Cout);
	input A, B, D;
	output Out, Cout;
	
	wire w1, w2, w3, w4;
	
	HalfAdder Ha_Inst(
		.A(A),
		.B(B),
		.Sum(w1),
		.Carry(w3)
	);
	
	HalfSubtractor HS_Inst(
		.A(A),
		.B(B),
		.Different(w2),
		.Borrow(w4)
	);
	
	Mux2_1 Selector_Inst0(
		.data_o(Out),
		.dataA_i(w1),
		.dataB_i(w2),
		.select_i(D)
	);
	
	Mux2_1 Selector_Inst1(
		.data_o(Cout),
		.dataA_i(w3),
		.dataB_i(w4),
		.select_i(D)
	);
endmodule