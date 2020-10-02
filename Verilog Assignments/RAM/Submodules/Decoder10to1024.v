module Decoder10to1024(data_i, data_o, e_i);
	input [9:0] data_i;
	input e_i;
	output [1023:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[9]);
	and(w1, w0, e_i);
	and(w2, data_i[9], e_i);
	
	Decoder8to256 D8to256_Inst[1:0](
		.data_i(data_i[8:0]),
		.data_o(data_o[1023:0]),
		.e_i({w2, w1})
	);

endmodule