module DFFwPreNClr(PreN, ClrN, D, Clk, Q, QN);
	input PreN, ClrN, D, Clk;
	output Q, QN;
	
	wire DN, Clk_N, w1, w2, w3, w4, w5, w6;
	
	not(DN, D);
	not(Clk_N, Clk);
	
	nand(w1, D, Clk_N);
	nand(w2, DN, Clk_N);
	
	nand(w3, PreN, w1, w4);
	nand(w4, ClrN, w2, w3);
	
	nand(w5, w3, Clk);
	nand(w6, w4, Clk);
	
	nand(Q, PreN, w5, QN);
	nand(QN, ClrN, w6, Q);
endmodule