module PushDownStack(Rst, PushPop, En, data_i, data_o, empty, full, Clk);
	// Define bus width here
	parameter DATAWIDTH = 8;
	parameter ADDRWIDTH = 10;
	
	input Rst, PushPop, En, Clk;
	input [DATAWIDTH - 1:0] data_i;
	output empty, full;
	output [DATAWIDTH - 1:0] data_o;
	
	// Internal wires
	wire [ADDRWIDTH - 1:0] Top_Output;
	wire [ADDRWIDTH - 1:0] TopMinusOne_Output;
	wire [ADDRWIDTH - 1:0] Selector_Output;
	wire PushPop_Output, PushPop_N, Enable_Output;
	
	// Control logic
	not(PushPop_N, PushPop);
	and(PushPop_Output, PushPop, En);
	and(Enable_Output, PushPop_N, En);
	
	RAM RAM_Inst(
		.data_i(data_i[DATAWIDTH - 1:0]),
		.data_o(data_o[DATAWIDTH - 1:0]),
		.addr_i(Selector_Output[ADDRWIDTH - 1:0]),
		.WEn_i(Enable_Output),
		.OutEn(En)
	);
	
	UpDownCounterwRst Top(
		.D(PushPop_Output),
		.En(En),
		.Clk(Clk),
		.Out(Top_Output),
		.PreN(1'b1),
		.ClrN(Rst),
		.Cout()
	);
	
	UpDownCounterwRst TopMinusOne(
		.D(PushPop_Output),
		.En(En),
		.Clk(Clk),
		.Out(TopMinusOne_Output),
		.PreN(Rst),
		.ClrN(1'b1),
		.Cout()
	);
	
	Mux2_1 Selector_Inst [ADDRWIDTH - 1:0](
		.data_o(Selector_Output[ADDRWIDTH - 1:0]),
		.dataA_i(TopMinusOne_Output[ADDRWIDTH - 1:0]),
		.dataB_i(Top_Output[ADDRWIDTH - 1:0]),
		.select_i(Enable_Output)
	);
	
	// Output logic
	nor(empty, Top_Output[0], Top_Output[1], Top_Output[2], Top_Output[3], Top_Output[4], Top_Output[5],
			Top_Output[6], Top_Output[7], Top_Output[8], Top_Output[9]);
	and(full, Top_Output[0], Top_Output[1], Top_Output[2], Top_Output[3], Top_Output[4], Top_Output[5],
			Top_Output[6], Top_Output[7], Top_Output[8], Top_Output[9]);
endmodule