module Decoder3to8(data_i, data_o, e_i);
	input [2:0] data_i;
	input e_i;
	output [7:0] data_o;
	
	// Internal wires
	wire w0, w1, w2;
	
	not(w0, data_i[2]);
	and(w1, w0, e_i);
	and(w2, data_i[2], e_i);
	
	Decoder2to4 D2to4_Inst[1:0](
		.data_i(data_i[1:0]),
		.data_o(data_o[7:0]),
		.e_i({w2, w1})
	);

endmodule