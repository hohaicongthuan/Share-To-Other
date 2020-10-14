module word(WriteSelect, data_i, Clk, OutA, OutB, ReadA, ReadB);
	// Define register's width here
	parameter WIDTH = 32;
	
	input WriteSelect, Clk, ReadA, ReadB;
	input [WIDTH - 1:0] data_i;
	output [WIDTH - 1:0] OutA;
	output [WIDTH - 1:0] OutB;
	
	RegisterFileCell RFC_Inst [WIDTH - 1:0](
		.WriteSelect(WriteSelect),
		.data_i(data_i[WIDTH - 1:0]),
		.Clk(Clk),
		.OutA(OutA[WIDTH - 1:0]),
		.OutB(OutB[WIDTH - 1:0]),
		.ReadA(ReadA),
		.ReadB(ReadB)
	);
endmodule