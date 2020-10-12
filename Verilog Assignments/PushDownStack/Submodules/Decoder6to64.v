module Decoder6to64(data_i, data_o, e_i);
	input [5:0] data_i;
	input e_i;
	output [63:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[5]);
	and(w1, w0, e_i);
	and(w2, data_i[5], e_i);
	
	Decoder5to32 D5to32_Inst[1:0](
		.data_i(data_i[4:0]),
		.data_o(data_o[63:0]),
		.e_i({w2, w1})
	);

endmodule