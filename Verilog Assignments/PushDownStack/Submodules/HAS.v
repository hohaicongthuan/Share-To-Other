// Half Adder Subtractor
// Rewrite it once again at 10:19 AM, 8 Oct 2020

module HAS(Cin, Cout, D, DN, Q, QN, O);
	input Cin, D, DN, Q, QN;
	output O, Cout;
	
	wire w1, w2;
	
	and(w1, QN, D, Cin);
	and(w2, Q, DN, Cin);
	or(Cout, w1, w2);
	
	xor(O, Q, Cin);
endmodule