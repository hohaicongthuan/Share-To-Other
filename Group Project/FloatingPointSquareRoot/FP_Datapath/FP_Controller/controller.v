module controller (clk, negative, IE, WE, OE, ADDR_WR, ADDR_RDA, ADDR_RDB, ALU_Op);

    input clk, negative;
	output IE, WE, OE;
	output [2:0] ADDR_WR, ADDR_RDA, ADDR_RDB;
	output [1:0] ALU_Op;

    // wires
    wire [3:0] next_state_o;
    wire [3:0] reg_state_o;

    next_state next_state_inst0(
        .CurrentState_i(reg_state_o), 
        .negative(negative), 
        .NextState_o(next_state_o)
    );

    register_controller register_controller_inst0(
        .clk(clk),
        .data_i(next_state_o),
        .data_o(reg_state_o)
    );

    outputs outputs_inst0(
        .current_state(reg_state_o),
        .IE(IE), 
        .WE(WE), 
        .OE(OE), 
        .ADDR_WR(ADDR_WR), 
        .ADDR_RDA(ADDR_RDA), 
        .ADDR_RDB(ADDR_RDB), 
        .ALU_Op(ALU_Op)
    );
endmodule