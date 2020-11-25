module MUX2to1(I0, I1, S, O);
	input I1, I0, S;
	output O;
	
	assign O = S ? I1 : I0;
endmodule