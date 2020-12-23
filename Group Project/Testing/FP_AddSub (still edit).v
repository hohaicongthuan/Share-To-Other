module FP_AddSub(data_iA, data_iB, data_o, AddSub_Sel);
	input [31:0] data_iA, data_iB;
	input AddSub_Sel;
	output reg [31:0] data_o;
	
	reg SignProduct;
	reg [31:0] BigFloat, SmallFloat;
	reg [7:0] ExpA, ExpB, ExpDiff, ExpA_true, ExpB_true, Exp_True_1;
	reg [23:0] MantA, MantB;
	reg [24:0] Product, Exp_Final, Product_Final;
	reg [22:0] MantB_beforeshift, shiftedMant;
	
	always @ (data_iA, data_iB, AddSub_Sel) begin
			// Find out which number has the bigger exponent
			if (data_iA[30:23] > data_iB[30:23]) begin
				BigFloat = data_iA;
				SmallFloat = data_iB;
			end else begin
				BigFloat = data_iB;
				SmallFloat = data_iA;
			end
			
			// Separate all components (exponent, mantissa)
			ExpA = BigFloat[30:23]; ExpB = SmallFloat[30:23];
			MantA = { 1'b1, BigFloat[22:0] };
			MantB_beforeshift = SmallFloat[22:0];
			//MantB = { 1'b1, SmallFloat[22:0] };
			
			// Find exponents difference
			ExpA_true = ExpA - 8'd127;
			ExpB_true = ExpB - 8'd127;
			ExpDiff = ExpA - ExpB;
			
			// Shift Right the smaller Exponent to make the two equal
			shiftedMant = MantB_beforeshift >> ExpDiff;
			MantB = { 1'b1, shiftedMant[22:0] };
			
			// Add/Sub two Mantissas
			Product = (~AddSub_Sel) ? MantA + MantB : MantA - MantB;
			
			// Calculate result sign
			if ((BigFloat == data_iB) && AddSub_Sel)
				SignProduct = 1'b1;
			else
				if ((BigFloat == data_iB) && ~AddSub_Sel && BigFloat[31])
						SignProduct = 1'b1;
			else SignProduct = 1'b0;
			
			//------------------------------------
			if (Product[24] == 1'b1) 
				begin
					Exp_True_1 = ExpA_true + 8'd1;
					Exp_Final = Exp_True_1 + 8'd127;
					Product_Final = Product;
					data_o = { SignProduct, Exp_Final[7:0], Product_Final[23:1] };
				end
			else 
				begin
					Exp_Final = ExpA_true + 8'd127;
					Product_Final = Product;
					data_o = { SignProduct, Exp_Final[7:0],Product_Final[22:0] };
				end
	end
endmodule