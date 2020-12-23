module controller (current_state, IE, WE, OE, ADDR_WR, ADDR_RDA, ADDR_RDB, ALU_Op);

// declare ports
	input [3:0] current_state;
	output reg IE, WE, OE;
	output reg [2:0] ADDR_WR, ADDR_RDA, ADDR_RDB;
	output reg [1:0] ALU_Op;
	
// function description
	always @(current_state)
	begin
		case(current_state)
            4'b0000: // S0: ban dau
				begin
					IE = 0;
					WE = 0;
					ADDR_WR = 3'b000;
					ADDR_RDA = 3'b000;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b00;
					OE = 0;
				end
			4'b0001: // S1: nhap n
				begin
					IE = 1'b1;
					WE = 1'b1;
					ADDR_WR = 3'b001;
					ADDR_RDA = 3'b000;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b00;
					OE = 0;
				end
			4'b0010: // S2: x = n
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b010;
					ADDR_RDA = 3'b001;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b00;
					OE = 0;
				end	
			4'b0011: // S3: root = n / x
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b011;
					ADDR_RDA = 3'b001;
					ADDR_RDB = 3'b010;
					ALU_Op = 2'b10;
					OE = 0;
				end	
			4'b0100: // S4: root = root + x
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b011;
					ADDR_RDA = 3'b011;
					ADDR_RDB = 3'b010;
					ALU_Op = 2'b00;
					OE = 0;
				end	
			4'b0101: // S5: root = root / 2
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b011;
					ADDR_RDA = 3'b011;
					ADDR_RDB = 3'b101;
					ALU_Op = 2'b10;
					OE = 0;
				end	
            4'b0110: // S6: temp = root - x
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b100;
					ADDR_RDA = 3'b011;
					ADDR_RDB = 3'b010;
					ALU_Op = 2'b01;
					OE = 0;
				end	
			4'b0111: // S7: temp = |temp|
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b100;
					ADDR_RDA = 3'b100;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b11;
					OE = 0;
				end
			4'b1000: // S8: temp = tempm - I
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b100;
					ADDR_RDA = 3'b100;
					ADDR_RDB = 3'b110;
					ALU_Op = 2'b01;
					OE = 0;
				end
			4'b1001: // S9: x = root
				begin
					IE = 0;
					WE = 1'b1;
					ADDR_WR = 3'b010;
					ADDR_RDA = 3'b011;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b00;
					OE = 0;
				end
			4'b1010: // S10: x = root
				begin
					IE = 0;
					WE = 0;
					ADDR_WR = 3'b111;
					ADDR_RDA = 3'b011;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b00;
					OE = 1'b1;
				end
            default
				begin
					IE = 0;
					WE = 0;
					ADDR_WR = 3'b000;
					ADDR_RDA = 3'b000;
					ADDR_RDB = 3'b000;
					ALU_Op = 2'b00;
					OE = 0;
				end	
        endcase
	end
endmodule