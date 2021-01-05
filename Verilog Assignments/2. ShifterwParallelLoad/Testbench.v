`timescale 1ns/1ps

module Testbench();
    reg data_L, data_R, Clk, Rst_N;
    reg [7:0] data_i;
    reg [1:0] S_i;
    wire [7:0] Y_o;

    integer i, j;
    
    parameter waittime = 20;

    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end

    initial begin
        data_i = 0;
        data_L = 0;
        data_R = 0;
        Rst_N = 0;
        S_i = 0;

        #waittime;
        Rst_N = 1'b1;
        
        #waittime;
        data_i = 8'd1;
        S_i = 2'd1;

        #waittime;
        data_L = 1'b1;
        S_i = 2'd2;

        for (i = 0; i <= 1; i = i + 1) 
        begin
            for (j = 0; j <= 6; j = j + 1)
            begin
                #waittime;
                data_L = 0;
            end
            data_L = 1'b1;
            S_i = 2'd3;

        end


        #2000 $finish;
    end

    ShifterwParallelLoad SWPL_Inst(
        .data_i(data_i),
        .data_L(data_L),
        .data_R(data_R),
        .S_i(S_i),
        .Y_o(Y_o),
        .Clk(Clk),
        .Rst_N(Rst_N)
    );
endmodule