module floatingpoint_multiplier(dataA_i, dataB_i, data_o);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH - 1:0] dataA_i, dataB_i;
    output reg[DATA_WIDTH - 1:0] data_o;

    reg SignProduct_A, SignProduct_B, SignProduct_Final;
	reg [7:0] ExpA, ExpB, Exp_Final, ExpA_true, ExpB_true, Exp_true_afteradd, Exp_true_afteradd_1;
	reg [23:0] MantA, MantB;
    reg [49:0] Mant_Final;

    always @ (dataA_i, dataB_i) begin

        // separate parts
        SignProduct_A = dataA_i[31];
        SignProduct_B = dataB_i[31];
        ExpA = dataA_i[30:23]; ExpB = dataB_i[30:23];
	    MantA = { 1'b1, dataA_i[22:0] };
	    MantB = { 1'b1, dataB_i[22:0] };

        // calculate sign bit
        SignProduct_Final = SignProduct_A ^ SignProduct_B;

        // multiply two mantissas
        Mant_Final = MantA * MantB;

        // sutract each exponent to get "real exponent"
        ExpA_true = ExpA - 8'd127;
        ExpB_true = ExpB - 8'd127;

        if (Mant_Final[49] == 1) begin      // if mantissas overflow
            Exp_true_afteradd = ExpA_true + ExpB_true;          // add two exponents
            Exp_true_afteradd_1 = Exp_true_afteradd + 1'd1;     // add 1 to the exponent after adding them
            Exp_Final = Exp_true_afteradd_1 + 8'd127;           // convert to floating point format
            
            data_o = { SignProduct_Final, Exp_Final[7:0],Mant_Final[23:1] };
        end
        else begin
            Exp_true_afteradd = ExpA_true + ExpB_true;          // add two exponents
            Exp_Final = Exp_true_afteradd + 8'd127;             // convert to floating point format
            data_o = { SignProduct_Final, Exp_Final[7:0],Mant_Final[22:0] };
        end

        // Output
		
    end
endmodule
