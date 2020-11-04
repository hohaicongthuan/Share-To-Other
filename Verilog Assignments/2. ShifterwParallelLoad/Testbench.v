`timescale 1ns/1ps

module Testbench();
    parameter BUSWIDTH = 8;
    
    reg data_L, data_R, Clk;
    reg [BUSWIDTH - 1:0] data_i;
    reg [1:0] S_i;
    wire [BUSWIDTH - 1:0] Y_o;
    
    
    always @ (Clk) #10 Clk <= ~Clk;

    initial begin
        data_i = 0;
        data_L = 0;
        data_R = 0;
        S_i = 0;
        Clk = 0;
        #2000 $finish;
    end

    ShifterwParallelLoad SWPL_Inst(
        .data_i(data_i),
        .data_L(data_L),
        .data_R(data_R),
        .S_i(S_i),
        .Y_o(Y_o),
        .Clk(Clk)
    );
endmodule