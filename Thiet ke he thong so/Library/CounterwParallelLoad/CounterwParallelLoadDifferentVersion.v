module CounterwParallelLoadDifferentVersion(data_o, data_i, d_i, Clk, load_i, cout);
    // parameter BUS_WIDTH = 8; // Define bus width here
    
    input d_i, load_i, Clk;
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
	 wire	   [7:0] Q_N;
    wire    d_i_neg;

    not(d_i_neg, d_i);

    HAS HAS_Inst0 [0](data_o[0], d_i_neg, HAS_Cout[0], HAS_Output[0]);
    HAS HAS_Inst1 [1](data_o[1], HAS_Cout[0], HAS_Cout[1], HAS_Output[1]);
    HAS HAS_Inst2 [2](data_o[2], HAS_Cout[1], HAS_Cout[2], HAS_Output[2]);
    HAS HAS_Inst3 [3](data_o[3], HAS_Cout[2], HAS_Cout[3], HAS_Output[3]);
    HAS HAS_Inst4 [4](data_o[4], HAS_Cout[3], HAS_Cout[4], HAS_Output[4]);
    HAS HAS_Inst5 [5](data_o[5], HAS_Cout[4],  HAS_Cout[5], HAS_Output[5]);
    HAS HAS_Inst6 [6](data_o[6], HAS_Cout[5], HAS_Cout[6], HAS_Output[6]);
    HAS HAS_Inst7 [7](data_o[7], HAS_Cout[6], cout, HAS_Output[7]);

    Selector Selector_Inst0 [0](Selector_Output[0], HAS_Output[0], data_i[0], load_i);
    Selector Selector_Inst1 [1](Selector_Output[1], HAS_Output[1], data_i[1], load_i);
    Selector Selector_Inst2 [2](Selector_Output[2], HAS_Output[2], data_i[2], load_i);
    Selector Selector_Inst3 [3](Selector_Output[3], HAS_Output[3], data_i[3], load_i);
    Selector Selector_Inst4 [4](Selector_Output[4], HAS_Output[4], data_i[4], load_i);
    Selector Selector_Inst5 [5](Selector_Output[5], HAS_Output[5], data_i[5], load_i);
    Selector Selector_Inst6 [6](Selector_Output[6], HAS_Output[6], data_i[6], load_i);
    Selector Selector_Inst7 [7](Selector_Output[7], HAS_Output[7], data_i[7], load_i);

    DFlipFlop DFF_Inst0 [0](data_o[0], Q_N[0], Selector_Output[0], Clk);
    DFlipFlop DFF_Inst1 [1](data_o[1], Q_N[1], Selector_Output[1], Clk);
    DFlipFlop DFF_Inst2 [2](data_o[2], Q_N[2], Selector_Output[2], Clk);
    DFlipFlop DFF_Inst3 [3](data_o[3], Q_N[3], Selector_Output[3], Clk);
    DFlipFlop DFF_Inst4 [4](data_o[4], Q_N[4], Selector_Output[4], Clk);
    DFlipFlop DFF_Inst5 [5](data_o[5], Q_N[5], Selector_Output[5], Clk);
    DFlipFlop DFF_Inst6 [6](data_o[6], Q_N[6], Selector_Output[6], Clk);
    DFlipFlop DFF_Inst7 [7](data_o[7], Q_N[7], Selector_Output[7], Clk);

endmodule