module UpDownCounterwRst(D, En, Clk, Out, PreN, ClrN, Cout);
	// Define bus width here
	parameter BUSWIDTH = 10;
	
	input D, En, Clk, PreN, ClrN;
	output Cout;
	output [BUSWIDTH - 1:0] Out;
	
	wire [BUSWIDTH - 1:0] HAS_Out;
	wire [BUSWIDTH - 1:0] HAS_Cout;
	
	HAS HAS_Inst [BUSWIDTH - 1:0] (
		.B({HAS_Cout[BUSWIDTH - 2:0], En}),
		.A(Out[BUSWIDTH - 1:0]),
		.D(D),
		.Out(HAS_Out[BUSWIDTH - 1:0]),
		.Cout({Cout, HAS_Cout[BUSWIDTH - 2:0]})
	);
	
	DFFwPreNClr DFF_Inst [BUSWIDTH - 1:0] (
		.PreN(PreN),
		.ClrN(ClrN),
		.D(HAS_Out[BUSWIDTH - 1:0]),
		.Clk(Clk),
		.Q(Out[BUSWIDTH - 1:0]),
		.QN()
	);
endmodule