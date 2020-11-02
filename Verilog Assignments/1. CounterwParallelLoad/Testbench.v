`timescale 1ns/1ps

module Testbench();
    parameter waittime = 20;
    parameter DATA_WIDTH = 8;
    integer i, j, k;

    reg d_i, e_i, Clk, load_i, RST_N;
    reg [DATA_WIDTH - 1:0] data_i;
    wire [DATA_WIDTH - 1:0] data_o;
    wire cout;

    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end

    initial begin
        data_i = 0;
        d_i = 1'b0;
        e_i = 1'b1;
        load_i = 1'b0;
        RST_N = 1'b0;
        Clk = 1'b0;
        #waittime;
        RST_N = 1'b1;

        // Test counting forwards & backwards
        for (i = 0; i <= 1; i = i + 1) begin
            for (j = 0; j <= 255; j = j + 1) begin
                #waittime;
            end
            d_i = 1'b1; // Test counting backwards
        end

        // Test loading a number and then counting forwards & backwards
        for (k = 0; k <= 255; k = k + 1) begin
            data_i = k;
            load_i = 1'b1;
            #waittime;
            load_i = 1'b0;
            d_i = 1'b0;
            for (i = 0; i <= 1; i = i + 1) begin
                for (j = 0; j <= 255; j = j + 1) begin
                    #waittime;
                end
                data_i = k;
                load_i = 1'b1;
                #waittime;
                load_i = 1'b0;
                d_i = 1'b1;
            end
        end
        #2000 $finish;
    end

    // always @ (Clk) #10 Clk = ~Clk;

    CounterwParallelLoad CounterwParallelLoad_Inst(
        .data_o(data_o),
        .data_i(data_i),
        .d_i(d_i),
        .e_i(e_i),
        .Clk(Clk),
        .load_i(load_i),
        .cout(cout),
        .RST_N(RST_N)
    );
endmodule