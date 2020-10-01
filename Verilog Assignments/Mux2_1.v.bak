// 1-bit MUX 2 to 1

module Mux2_1(data_o, dataA_i, dataB_i, select_i);
    
    // Declare port type
    input dataA_i, dataB_i, select_i;
    output data_o;

    // Declare data type for ports
    wire data_o, dataA_i, dataB_i, select_i;

    // Internal wires declaration
    wire neg_select_i, w1, w2;

    // Functional Description
    not(neg_select_i, select_i);
    and(w1, dataA_i, neg_select_i);
    and(w2, dataB_i, select_i);
    or(data_o, w1, w2);

endmodule