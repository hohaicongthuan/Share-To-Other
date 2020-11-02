module RegisterFile(data_i, data_oA, data_oB, WriteAddr, WriteEn, ReadA, ReadAEn, ReadB, ReadBEn, Clk);
	// Define register file's width here
	parameter RF_WIDTH = 32;
	// Define data width here
	parameter Data_WIDTH = 32;
	// Define address width here
	parameter Addr_WIDTH = 5;
	
	input WriteEn, ReadAEn, ReadBEn, Clk;
	input [Data_WIDTH - 1:0] data_i;
	input [Addr_WIDTH - 1:0] WriteAddr, ReadA, ReadB;
	output [Data_WIDTH - 1:0] data_oA;
	output [Data_WIDTH - 1:0] data_oB;
	
	wire [RF_WIDTH - 1:0] WAddr_Output; // Output of write address decoder
	wire [RF_WIDTH - 1:0] ReadA_Addr_Output; // Output of ReadA address decoder
	wire [RF_WIDTH - 1:0] ReadB_Addr_Output; // Output of ReadB address decoder
	
	Decoder5to32 WAdrr_Inst(
		.data_i(WriteAddr[Addr_WIDTH - 1:0]),
		.data_o(WAddr_Output[RF_WIDTH - 1:0]),
		.e_i(WriteEn)
	);
	
	Decoder5to32 ReadA_Adrr_Inst(
		.data_i(ReadA[Addr_WIDTH - 1:0]),
		.data_o(ReadA_Addr_Output[RF_WIDTH - 1:0]),
		.e_i(ReadAEn)
	);
	
	Decoder5to32 ReadB_Adrr_Inst(
		.data_i(ReadB[Addr_WIDTH - 1:0]),
		.data_o(ReadB_Addr_Output[RF_WIDTH - 1:0]),
		.e_i(ReadBEn)
	);
	
	word word_Inst [RF_WIDTH - 1:0](
		.WriteSelect(WAddr_Output[RF_WIDTH - 1:0]),
		.data_i(data_i[Data_WIDTH - 1:0]),
		.Clk(Clk),
		.OutA(data_oA[Data_WIDTH - 1:0]),
		.OutB(data_oB[Data_WIDTH - 1:0]),
		.ReadA(ReadA_Addr_Output[RF_WIDTH - 1:0]),
		.ReadB(ReadB_Addr_Output[RF_WIDTH - 1:0])
	);
endmodule