 // This is a testbench for FP_SquareRoot.v
 
 `timescale 1ns/1ps

module Testbench();
    parameter waittime = 20;
    parameter clocktime = 10;
    parameter DATAWIDTH = 32;
    integer i, outfile;

    reg clk;
    reg [DATAWIDTH - 1:0] data_i;
    wire [DATAWIDTH - 1:0] data_o;
    
    initial begin
      clk = 1'b0; // Initial value of the clock signal
      forever #clocktime clk = ~clk; // Generates clock pulses forever
  end
    
    initial begin
        outfile = $fopen("TestResults.txt", "w");
        $fdisplay(outfile, "%b", data_o);
        $fclose(outfile);
        #2000 $finish;
    end

    FP_SquareRoot FP_SR_Inst0(
        .data_i(data_i),
        .data_o(data_o),
        .clk(clk)
    );
endmodule