module datapath (clk, data_i, data_o, negative_o, zero_o, mux_o, RDA_o, RDB_o, ALU_o
                // Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7
                );
    
    parameter DATA_WITDH = 32;
    
    input [DATA_WITDH - 1:0] data_i;
    input clk;
    output [DATA_WITDH - 1:0] data_o;
    output negative_o, zero_o;
    output [DATA_WITDH - 1:0] mux_o;
    output [DATA_WITDH - 1:0] RDA_o;
    output [DATA_WITDH - 1:0] RDB_o;
    output [DATA_WITDH - 1:0] ALU_o;
    // output [(DATA_WITDH-1):0] Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7;
    
// controller wires
    wire IE, WE, OE;
	wire [2:0] ADDR_WR, ADDR_RDA, ADDR_RDB;
	wire [1:0] ALU_Op;

// MUX truoc RegisterFile
    Mux2To1_32bit Mux2To1_32bit_inst0 (
        .select_i(IE),
        .dataA_i(ALU_o),
        .dataB_i(data_i), 
        .data_o(mux_o), 
    );

// RegisterFile
    RegisterFile RegisterFile_inst0 (
	    .clk(clk),
	    .data_i(mux_o), 
	    .addr_wr_i(ADDR_WR), 
	    .WE_i(WE), 
	    .addr_rda_i(ADDR_RDA), 
	    .addr_rdb_i(ADDR_RDB), 
	    .RDA_o(RDA_o), 
	    .RDB_o(RDB_o),
	    /*.Reg_0(Reg_0),
	    .Reg_1(Reg_1), 
	    .Reg_2(Reg_2),
	    .Reg_3(Reg_3), 
	    .Reg_4(Reg_4), 
	    .Reg_5(Reg_5), 
	    .Reg_6(Reg_6), 
	    .Reg_7(Reg_7)*/
	);

// ALU
    ALU ALU_inst0 (
        .A_i(RDA_o), 
        .B_i(RDB_o), 
        .opcode_i(ALU_Op), 
        .data_o(ALU_o), 
        .ALU_zero(zero_o), 
        .negative(negative_o)
    );

// Reg sau ALU
    register_OE register_OE_inst0 (
        .clk(clk),
        .data_i(ALU_o),
        .data_o(data_o), 
        .OE_i(OE)
    );

    controller controller_inst0(
        .clk(clk),
        .negative(negative),
        .IE(IE), 
        .WE(WE), 
        .OE(OE), 
        .ADDR_WR(ADDR_WR), 
        .ADDR_RDA(ADDR_RDA), 
        .ADDR_RDB(ADDR_RDB), 
        .ALU_Op(ALU_Op)
    );
endmodule