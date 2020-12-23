module ALU(A_i, B_i, opcode_i, data_o, ALU_zero, negative);
    parameter DATA_WITDH = 32;

    // declare ports
    input [DATA_WITDH - 1:0] A_i;
    input [DATA_WITDH - 1:0] B_i;
    input [1:0] opcode_i;
    output [DATA_WITDH - 1:0] data_o;
    output reg ALU_zero, negative;

    // declare data type of ports (wire by default)
	 reg [DATA_WITDH - 1:0] data_o;

    // function description
    always @ (A_i, B_i, opcode_i)
    begin
        case(opcode_i)
            /*3'b000: data_o = A_i + B_i;			// ADD
            3'b001: data_o = A_i - B_i;			// SUB
            3'b010: data_o = A_i & B_i;			// AND
            3'b011: data_o = A_i | B_i;			// OR
            3'b100: data_o = A_i ^ B_i;			// XOR
            3'b101: data_o = A_i >> B_i[2:0];	// Dich phai
            3'b110: data_o = A_i >> B_i[2:0];	// Dich phai so hoc			
            3'b111: data_o = A_i << B_i[2:0];	// Dich trai*/
            default data_o = 32'd0;
        endcase

        if (data_o == 32'd0) ALU_zero = 1'b1;
        else ALU_zero = 0;
    end
endmodule