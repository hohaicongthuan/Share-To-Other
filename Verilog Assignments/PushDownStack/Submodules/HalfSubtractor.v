module HalfSubtractor(A, B, Different, Borrow);
	input A, B;
	output Different, Borrow;
	
	wire w1;
	
	not(w1, A);
	xor(Different, A, B);
	and(Borrow, w1, B);
endmodule