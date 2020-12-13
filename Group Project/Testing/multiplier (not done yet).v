module floatingpoint_multiplier(dataA_i, dataB_i, data_o);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH - 1:0] dataA_i, dataB_i;
    output reg[DATA_WIDTH - 1:0] data_o;

    reg SignProduct_A, SignProduct_B, SignProduct_Final;
	reg [7:0] ExpA, ExpB, Exp_Final;
	reg [23:0] MantA, MantB;
    reg [49:0] Mant_Final;

    always @ (dataA_i, dataB_i) begin

        // separate parts
        SignProduct_A = dataA_i[31];
        SignProduct_B = dataB_i[31];
        ExpA = dataA_i[30:23]; ExpB = dataB_i[30:23];
	    MantA = { 1'b1, dataA_i[22:0] };
	    MantB = { 1'b1, dataB_i[22:0] };

        SignProduct_Final = SignProduct_A ^ SignProduct_B;

        Mant_Final = MantA * MantB;

        if (Mant_Final[49] == 1) begin
            Exp_Final = ExpA + ExpB;
            Exp_Final = Exp_Final + 1'd1;
            Exp_Final = Exp_Final - 8'd127;
        end
        else begin
            Exp_Final = ExpA + ExpB;
            Exp_Final = Exp_Final - 8'd127;
        end

        // Output
		data_o = { SignProduct_Final, Exp_Final[7:0],Mant_Final[22:0] };
    end
endmodule