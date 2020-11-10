module RAM(data_io, addr_i, WEn_i, CS_i);
	inout [7:0] data_io;
	input [9:0] addr_i;
	input WEn_i, CS_i;
	
	// Internal wires
	wire [1023:0] w1;
	wire [7:0] RAM_Output;
	wire Write_Enable;
	wire Tri_Enable;
	wire WEn_i_not;

	not(WEn_i_not, WEn_i);
	and(Write_Enable, WEn_i, CS_i);
	and(Tri_Enable, WEn_i_not, CS_i);
	
	word word_Inst[1023:0](
		.RowSel_i(w1[1023:0]),
		.data_i(data_io[7:0]),
		.data_o(RAM_Output[7:0]),
		.WEn_i(Write_Enable)
	);
	
	Decoder10to1024 D10to1024_Inst(
		.data_i(addr_i[9:0]),
		.data_o(w1[1023:0]),
		.e_i(1'b1)
	);
	
	TriState Tri_Inst [7:0](
		.data_i(RAM_Output[7:0]),
		.oe(Tri_Enable),
		.data_o(data_io[7:0])
	);
endmodule