module CounterwParallelLoad(data_o, data_i, d_i, e_i, Clk, load_i, cout, RST_N);
    parameter DATA_WIDTH = 8;
    
    input d_i, e_i, load_i, Clk, RST_N;
    input [DATA_WIDTH - 1:0] data_i;
    output [DATA_WIDTH - 1:0] data_o;
    output cout;

    wire d_i, load_i, Clk, cout, RST_N;
    wire [DATA_WIDTH - 1:0] data_i;
    wire [DATA_WIDTH - 1:0] data_o;

    // Internal wires declaration
    wire    [DATA_WIDTH - 1:0] HAS_Output;
    wire    [DATA_WIDTH - 1:0] Selector_Output;
    wire    [DATA_WIDTH - 1:0] HAS_Cout;
	 wire		[DATA_WIDTH - 1:0] Q_N;
    wire    d_i_neg;

    not(d_i_neg, d_i);

    HAS HAS_Inst [DATA_WIDTH - 1:0](
			.Q(data_o[DATA_WIDTH - 1:0]),
			.Cin({HAS_Cout[DATA_WIDTH - 2:0], e_i}),
			.Cout({cout, HAS_Cout[DATA_WIDTH - 2:0]}),
			.O(HAS_Output[DATA_WIDTH - 1:0]),
			.D(d_i),
			.D_N(d_i_neg),
			.Q_N(Q_N[DATA_WIDTH - 1:0])
	);

    Selector Selector_Inst [DATA_WIDTH - 1:0](
        .data_o(Selector_Output[DATA_WIDTH - 1:0]),
        .dataA_i(HAS_Output[DATA_WIDTH - 1:0]),
        .dataB_i(data_i[DATA_WIDTH - 1:0]),
        .select_i(load_i)
    );

    DFlipFlop DFF_Inst [DATA_WIDTH - 1:0](
        .Q(data_o[DATA_WIDTH - 1:0]),
        .QN(Q_N[DATA_WIDTH - 1:0]),
        .D(Selector_Output[DATA_WIDTH - 1:0]),
        .Clk(Clk),
		  .PreN(1'b1),
		  .ClrN(RST_N)
    );

endmodule