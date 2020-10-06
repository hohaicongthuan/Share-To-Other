`timescale 1ns/1ps

module Testbench();
    reg WEn_i;
    reg [7:0] data_i;
    reg [9:0] addr_i;
    wire [7:0] data_o;
    
    parameter waittime = 50;
    
    initial begin
        data_i = 0;
        addr_i = 0;
        WEn_i = 0;
        #waittime;
        data_i = 8'd9;
        addr_i = 10'd100;
        WEn_i = 1'b1;
        #waittime;
        WEn_i = 1'b0;
        #waittime;
        #2000 $finish;
    end

    RAM RAM_Inst(
        .data_i(data_i),
        .data_o(data_o),
        .addr_i(addr_i),
        .WEn_i(WEn_i)
    );
endmodule
