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

    initial begin
        clk = 0;
        data_i = 32'd4;
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
        .zero_o(zero_o)
    );
endmodule