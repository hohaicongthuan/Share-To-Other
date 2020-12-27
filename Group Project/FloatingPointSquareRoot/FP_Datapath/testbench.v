`timescale 1ns/1ps

module testbench();
    parameter waittime = 20;
    parameter DATA_WITDH = 32;
    parameter ADDR_WIDTH = 3;
    integer i;

    reg [DATA_WITDH - 1:0] data_i;
    reg clk;
    wire [DATA_WITDH - 1:0] data_o;
    wire negative_o, zero_o;
    wire [DATA_WITDH - 1:0] mux_o;
    wire [DATA_WITDH - 1:0] RDA_o;
    wire [DATA_WITDH - 1:0] RDB_o;
    wire [DATA_WITDH - 1:0] ALU_o;

    initial begin
        clk = 0;
        data_i = 0;
        for (i = 0; i < 50; i = i + 1) begin
            clk = ~clk;
            #waittime;
        end
    end

    datapath datapath_inst0 (
        .clk(clk), 
        .data_i(data_i), 
        .data_o(data_o), 
        .negative_o(negative_o), 
        .zero_o(zero_o), 
        .mux_o(mux_o), 
        .RDA_o(RDA_o), 
        .RDB_o(RDB_o), 
        .ALU_o(ALU_o)
    );
endmodule