module integer_subtractor(sobitru_i, sotru_i, data_o);
    parameter DATA_WIDTH = 8;
    input [DATA_WIDTH - 1:0] sobitru_i;
    input [DATA_WIDTH - 1:0] sotru_i;
    output [DATA_WIDTH - 1:0] data_o;

    assign data_o = sobitru_i - sotru_i;
endmodule