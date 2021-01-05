module Decoder4to16(data_i, data_o, e_i);
	input [3:0] data_i;
	input e_i;
	output [15:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[3]);
	and(w1, w0, e_i);
	and(w2, data_i[3], e_i);
	
	Decoder3to8 D3to8_Inst[1:0](
		.data_i(data_i[2:0]),
		.data_o(data_o[15:0]),
		.e_i({w2, w1})
	);

endmodule