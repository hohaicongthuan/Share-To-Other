module UpDownCounterwRst(D, E, O, Rst, Clk, Cout);
	// Define bus width here
	parameter BUSWIDTH = 10;
	
	input D, E, Rst, Clk;
	output Cout;
	output reg [BUSWIDTH - 1:0] O;
	
	wire DN, RstN;
	wire [BUSWIDTH - 1:0] QN;
	wire [BUSWIDTH - 1:0] HAS_Out;
	wire [BUSWIDTH - 1:0] HAS_Cout;
	
	not(DN, D);
	not(RstN, Rst);
	
	HAS HAS_Inst [BUSWIDTH - 1:0](
		.Cin({HAS_Cout[BUSWIDTH - 2:0], E}),
		.Cout({Cout, HAS_Cout[BUSWIDTH - 2:0]}),
		.D(D),
		.DN(DN),
		.Q(O[BUSWIDTH - 1:0]),
		.QN(QN[BUSWIDTH - 1:0]),
		.O(HAS_Out[BUSWIDTH - 1:0])
	);
	
	DFFwPreNClr DFF_Inst [BUSWIDTH - 1:0] (
		.PreN(),
		.ClrN(RstN),
		.D(HAS_Out[BUSWIDTH - 1:0]),
		.Clk(Clk),
		.Q(O[BUSWIDTH - 1:0]),
		.QN(QN[BUSWIDTH - 1:0])
	);
endmodule