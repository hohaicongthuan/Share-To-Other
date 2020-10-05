`timescale 1ns/1ps

module Testbench();
    reg data_i, data_o, addr_i, WEn_i;
    initial begin
        data_i = 0;
        addr_i = 0;
        WEn_i = 0;
        #2000 $finish;
    end

    always @ (clk) #10 clk <= ~clk;

    RAM RAM_Inst(
        .data_i(),
        .data_o(),
        .addr_i(),
        .WEn_i()
    );
endmodule