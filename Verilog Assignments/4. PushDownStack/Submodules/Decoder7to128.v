module Decoder7to128(data_i, data_o, e_i);
	input [6:0] data_i;
	input e_i;
	output [127:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[6]);
	and(w1, w0, e_i);
	and(w2, data_i[6], e_i);
	
	Decoder6to64 D6to64_Inst[1:0](
		.data_i(data_i[5:0]),
		.data_o(data_o[127:0]),
		.e_i({w2, w1})
	);

endmodule