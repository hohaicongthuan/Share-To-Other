module Decoder2to4(data_i, data_o, e_i);
	input [1:0] data_i;
	input e_i;
	output [3:0] data_o;
	
	// Internal wires
	wire [1:0] data_i_neg;
	
	not(data_i_neg[0], data_i[0]);
	not(data_i_neg[1], data_i[1]);
	
	and(data_o[0], e_i, data_i_neg[1], data_i_neg[0]);
	and(data_o[1], e_i, data_i_neg[1], data_i[0]);
	and(data_o[2], e_i, data_i[1], data_i_neg[0]);
	and(data_o[3], e_i, data_i[1], data_i[0]);
endmodule