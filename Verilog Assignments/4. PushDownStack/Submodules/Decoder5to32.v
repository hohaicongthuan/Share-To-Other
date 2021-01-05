module Decoder5to32(data_i, data_o, e_i);
	input [4:0] data_i;
	input e_i;
	output [31:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[4]);
	and(w1, w0, e_i);
	and(w2, data_i[4], e_i);
	
	Decoder4to16 D4to16_Inst[1:0](
		.data_i(data_i[3:0]),
		.data_o(data_o[31:0]),
		.e_i({w2, w1})
	);

endmodule