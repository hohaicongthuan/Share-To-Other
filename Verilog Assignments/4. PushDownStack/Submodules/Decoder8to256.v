module Decoder8to256(data_i, data_o, e_i);
	input [7:0] data_i;
	input e_i;
	output [255:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[7]);
	and(w1, w0, e_i);
	and(w2, data_i[7], e_i);
	
	Decoder7to128 D7to128_Inst[1:0](
		.data_i(data_i[6:0]),
		.data_o(data_o[255:0]),
		.e_i({w2, w1})
	);

endmodule