module integer_sub_15(data_i, data_o);
    parameter DATA_WIDTH = 8;
    input [DATA_WIDTH - 1:0] data_i;
    output [DATA_WIDTH - 1:0] data_o;

    assign data_o = data_i - 8'd15;
endmodule