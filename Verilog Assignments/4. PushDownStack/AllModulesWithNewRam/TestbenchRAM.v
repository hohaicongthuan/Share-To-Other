`timescale 1ns/1ps

module TestbenchRAM();
    reg WEn_i, CS_i;
    reg [9:0] addr_i;
    reg [7:0] data_io;
    
    parameter waittime = 20;
	integer i;

    /*initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
    end*/

    initial begin
        data_io = 0;
        addr_i = 0;
        WEn_i = 0;
        CS_i = 0;
        #waittime;

        for (i = 0; i < 1023; i = i + 1) begin
            addr_i = i;
	        #10;
            data_io = i;
            WEn_i = 1'b1;
            #waittime;
            WEn_i = 1'b0;
	    // OutEn = 1'b1;
            #waittime;
        end
        #2000 $finish;
    end

    RAM RAM_Inst(
        .data_io(data_io),
        .addr_i(addr_i),
        .WEn_i(WEn_i),
        .CS_i(CS_i)
    );
endmodule