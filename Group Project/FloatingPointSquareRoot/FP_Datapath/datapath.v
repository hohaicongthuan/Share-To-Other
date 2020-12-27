module datapath (clk, data_i, data_o, negative_o, zero_o
                // Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7
                );
    
    parameter DATA_WITDH = 32;
    
    input [DATA_WITDH - 1:0] data_i;
    input clk;
    output [DATA_WITDH - 1:0] data_o;
    output negative_o, zero_o;
    // output [(DATA_WITDH-1):0] Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7;
    
// controller wires
    wire IE, WE, OE;
	wire [2:0] ADDR_WR, ADDR_RDA, ADDR_RDB;
	wire [1:0] ALU_Op;
    wire [DATA_WITDH - 1:0] mux_o;
    wire [DATA_WITDH - 1:0] RDA_o;
    wire [DATA_WITDH - 1:0] RDB_o;
    wire [DATA_WITDH - 1:0] ALU_o;

// MUX truoc RegisterFile
    Mux2To1_32bit Mux2To1_32bit_inst0 (
        .select_i(IE),
        .dataA_i(ALU_o),
        .dataB_i(data_i), 
        .data_o(mux_o)
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
	    .RDB_o(RDB_o)
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
        .data_iA(RDA_o), 
        .data_iB(RDB_o), 
        .ALU_Op(ALU_Op), 
        .data_o(ALU_o), 
        .flg_zero(zero_o), 
        .flg_negative(negative_o)
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