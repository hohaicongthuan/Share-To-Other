// 1-bit MUX 2 to 1 16 bit

module Mux2To1_32bit(data_o, dataA_i, dataB_i, select_i);
    
    parameter DATA_WITDH = 32;

    // Declare port type
    input [DATA_WITDH - 1:0] dataA_i;
     input [DATA_WITDH - 1:0] dataB_i;
     input select_i;
    output [DATA_WITDH - 1:0] data_o;

    // Declare data type for ports (all wire by default)
     
    // Internal wires declaration

    // Functional Description
    assign data_o = (select_i == 1'b0) ? dataA_i : dataB_i;

endmodule