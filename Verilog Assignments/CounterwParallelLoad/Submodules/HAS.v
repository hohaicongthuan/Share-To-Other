// Half Adder - Subtractor

module HAS(Q, Cin, Cout, O, D, D_N, Q_N);
    input Q, Cin, D, D_N, Q_N;
    output Cout, O;
		
    wire w1, w2;
	 
    and(w1, D, Q_N, Cin);
	 and(w2, D_N, Q, Cin);
	 or(Cout, w1, w2);
    xor(O, Q, Cin);

endmodule