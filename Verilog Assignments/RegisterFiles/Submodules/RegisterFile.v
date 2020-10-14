module RegisterFile(data_i, data_o, WriteAddr, WriteEn, ReadA, ReadAEn, ReadB, ReadBEn, Clk);
	input WriteEn, ReadAEn, ReadBEn, Clk;
	input [31:0] data_i;
	input [4:0] WriteAddr, ReadA, ReadB;
	output [31:0] data_o;
	
	
endmodule