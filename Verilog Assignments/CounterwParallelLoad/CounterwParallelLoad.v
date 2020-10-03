module CounterwParallelLoad(data_o, data_i, d_i, e_i, Clk, load_i, cout);
    //parameter BUS_WIDTH = 8; // Define bus width here
    
    input d_i, e_i, load_i, Clk;
    input [7:0] data_i;
    output [7:0] data_o;
    output cout;

    wire d_i, load_i, Clk, cout;
    wire [7:0] data_i;
    wire [7:0] data_o;

    // Internal wires declaration
    wire    [7:0] HAS_Output;
    wire    [7:0] Selector_Output;
    wire    [7:0] HAS_Cout;
	 // wire		[7:0] Q_N;

    HAS HAS_Inst [7:0](
			.Q(data_o[7:0]),
			.Cin({HAS_Cout[6:0], e_i}),
			.Cout({cout, HAS_Cout[6:0]}),
			.O(HAS_Output[7:0]),
			.D(d_i)
	);

    Selector Selector_Inst [7:0](
        .data_o(Selector_Output[7:0]),
        .dataA_i(HAS_Output[7:0]),
        .dataB_i(data_i[7:0]),
        .select_i(load_i)
    );

    DFlipFlop DFF_Inst [7:0](
        .Q(data_o[7:0]),
        .Q_N(),
        .D(Selector_Output[7:0]),
        .clk(Clk)
    );

endmodule