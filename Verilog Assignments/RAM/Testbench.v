`timescale 1ns/1ps

module Testbench();
    reg WEn_i;
    reg [7:0] data_i;
    reg [9:0] addr_i;
    wire [7:0] data_o;
    
    parameter waittime = 20;
	 integer i;

    /*initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end*/

    initial begin
        data_i = 0;
        addr_i = 0;
        WEn_i = 0;
        #waittime;

        for (i = 0; i < 1023; i = i + 1) begin
            addr_i = i;
            data_i = i;
            WEn_i = 1'b1;
            #waittime;
            WEn_i = 1'b0;
            #waittime;
        end
        #2000 $finish;
    end

    RAM RAM_Inst(
        .data_i(data_i),
        .data_o(data_o),
        .addr_i(addr_i),
        .WEn_i(WEn_i)
    );
endmodule