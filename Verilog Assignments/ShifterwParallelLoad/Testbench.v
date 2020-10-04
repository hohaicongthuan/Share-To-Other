`timescale 1ns/1ps
module Testbench();
reg data_i, data_L, data_R, S_i, Y_o, clk;
initial begin
    data_i = 0;
    data_L = 0;
    data_R = 0;
    S_i = 0;
    #2000 $finish;
end

always @ (clk) #10 clk <= ~clk;

ShifterwParallelLoad SWPL_Inst(
    .data_i(data_i),
    .data_L(data_L),
    .data_R(data_R),
    .S_i(S_i),
    .Y_o(Y_o),
    .clk(clk)
);

endmodule