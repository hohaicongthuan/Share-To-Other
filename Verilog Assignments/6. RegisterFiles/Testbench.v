 `timescale 1ns/1ps

module Testbench();
    parameter waittime = 20;
    integer i;

    reg WriteEn, ReadAEn, ReadBEn, Clk;
    reg [4:0] ReadA, ReadB, WriteAddr;
    reg [31:0] data_i;
    wire [31:0] data_oA, data_oB;
    
    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #10 Clk = ~Clk; // Generates clock pulses forever
  end
    
    initial begin
        WriteEn = 0;
        ReadAEn = 0;
        ReadBEn = 0;
        Clk = 0;
        ReadA = 0;
        ReadB = 0;
        WriteAddr = 0;
        data_i = 0;

        // Write data to the register file
        for (i = 0; i < 32; i = i + 1) begin
            WriteAddr = i;
            data_i = i;
            WriteEn = 1'b1;
            #waittime;
            WriteEn = 1'b0;
            #waittime;
        end

        // Read data from the register file
        for (i = 0; i < 31; i = i + 1) begin
            ReadAEn = 1'b1;
            ReadA = i;
            #waittime;
            ReadAEn = 1'b0;
            #waittime;
        end

        for (i = 0; i < 32; i = i + 1) begin
            ReadBEn = 1'b1;
            ReadB = i;
            #waittime;
            ReadBEn = 1'b0;
            #waittime;
        end
        #2000 $finish;
    end

    //always @ (Clk) #10 Clk <= ~Clk;

    RegisterFile RF_Inst(
        .data_i(data_i),
        .data_oA(data_oA),
        .data_oB(data_oB),
        .WriteAddr(WriteAddr),
        .WriteEn(WriteEn),
        .ReadA(ReadA),
        .ReadAEn(ReadAEn),
        .ReadB(ReadB),
        .ReadBEn(ReadBEn),
        .Clk(Clk)
    );
endmodule