module CounterwParallelLoad(data_o, data_i, d_i, e_i, clk, load_i, cout);
    parameter BUS_WIDTH = 8; // Define bus width here
    input d_i, e_i, load_i, clk;
    input [BUS_WIDTH - 1:0] data_i;
    output [BUS_WIDTH - 1:0] data_o;
    output cout;
    wire d_i, e_i, load_i, clk, cout;
    wire [BUS_WIDTH - 1:0] data_i;
    wire [BUS_WIDTH - 1:0] data_o;
    // Internal wires declaration
    wire    [BUS_WIDTH - 1:0] HAS_Output;
    wire    [BUS_WIDTH - 1:0] Q_N;
    wire    [BUS_WIDTH - 1:0] Selector_Output;
    wire    [BUS_WIDTH - 1:0] HAS_Cout;
    wire    d_i_neg;
    not(d_i_neg, d_i);
    HAS HAS_Inst [BUS_WIDTH - 1:0](
			.D(d_i),
			.D_N(d_i_neg),
			.Q(data_o[BUS_WIDTH - 1:0]),
			.Q_N(Q_N[BUS_WIDTH - 1:0]),
			.Cin({HAS_Cout[BUS_WIDTH - 2:0], e_i}),
			.Cout({cout, HAS_Cout[BUS_WIDTH - 2:0]}),
			.O(HAS_Output[BUS_WIDTH - 1:0])
	);
    Selector Selector_Inst [BUS_WIDTH - 1:0](
        .data_o(Selector_Output),
        .dataA_i(HAS_Output[BUS_WIDTH - 1:0]),
        .dataB_i(data_i[BUS_WIDTH - 1:0]),
        .select_i(load_i)
    );
    DFlipFlop DFF_Inst [BUS_WIDTH - 1:0](
        .Q(data_o[BUS_WIDTH - 1:0]),
        .Q_N(Q_N[BUS_WIDTH - 1:0]),
        .D(Selector_Output[BUS_WIDTH - 1:0]),
        .clk(clk)
    );
endmodule