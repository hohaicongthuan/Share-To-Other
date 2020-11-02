module D_Latch(D, E, Q, Q_N);
	input D, E;
	output Q, Q_N;
	
	// Internal wires
	wire w1, w2, D_N;
	
	not(D_N, D);
	and(w1, D_N, E);
	and(w2, D, E);
	nor(Q, w1, Q_N);
	nor(Q_N, w2, Q);
endmodule