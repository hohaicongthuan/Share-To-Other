module FP_SquareRoot(data_i, data_o, clk);
    parameter DATA_WITDH = 32;
    
    input clk;
    input [DATA_WITDH - 1:0] data_i;
    output [DATA_WITDH - 1:0] data_o;

    controller Controller_Inst0();
    datapath Datapath_Inst0();
endmodule