// 1-bit MUX 4 to 1

module Mux4_1(data_o, dataA_i, dataB_i, dataC_i, dataD_i, select1_i, select2_i);
    
    // Declare port type
    input dataA_i, dataB_i, dataC_i, dataD_i, select1_i, select2_i;
    output data_o;

    // Declare data type for ports
    wire data_o, dataA_i, dataB_i, dataC_i, dataD_i, select1_i, select2_i;

    // Internal wires declaration
    wire neg_select_i, w1, w2;

    // Functional Description
    Mux2_1 Mux2_1_inst0(
        .dataA_i(dataA_i),
        .dataB_i(dataB_i),
        .select_i(select1_i),
        .data_o(w1)
    );

    Mux2_1 Mux2_1_inst1(
        .dataA_i(dataC_i),
        .dataB_i(dataD_i),
        .select_i(select1_i),
        .data_o(w2)
    );

    Mux2_1 Mux2_1_inst3(
        .dataA_i(w1),
        .dataB_i(w2),
        .select_i(select2_i),
        .data_o(data_o)
    );

endmodule