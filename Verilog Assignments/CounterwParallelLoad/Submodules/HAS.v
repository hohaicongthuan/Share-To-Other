// Half Adder - Subtractor

module HAS(Q, Cin, Cout, O, D);
    input Q, Cin, D;
    output Cout, O;
		
    wire w1, w2, Q_N, D_N;
	 
	 not(D_N, D);
	 not(Q_N, Q);
	 
    and(w1, D, Q_N, Cin);
	 and(w2, D_N, Q, Cin);
	 or(Cout, w1, w2);
    xor(O, Q, Cin);

endmodule