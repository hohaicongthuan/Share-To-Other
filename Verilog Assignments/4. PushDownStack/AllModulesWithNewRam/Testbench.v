`timescale 1ns/1ps

module Testbench();
    parameter waittime = 30;
    parameter ClkDelay = 10;
    integer i;

    reg Rst, PushPop, En, Clk;
    reg [7:0] data_i;
    wire [7:0] data_o;
    wire empty, full;
    
    initial begin
      Clk = 1'b0; // Initial value of the clock signal
      forever #ClkDelay Clk = ~Clk; // Generates clock pulses forever
    end

    initial begin
        Rst = 0;
        PushPop = 0;
        En = 0;
        data_i = 0;
        #waittime;
        Rst = 1'b1;
        #waittime;

        // Push data to the stack
        
        for (i = 1; i < 1023; i = i + 1) begin
            PushPop = 1'b0;
            data_i = i;
            // En = 1'b1;
            #waittime;
            // En = 1'b0;
            #waittime;
        end
        

      

        #waittime;
        data_i = 8'd0;

        // Pop data from the stack
            PushPop = 1'b1;
            // En = 1'b1;
        #waittime;

        #2000 $finish;
    end

    //always @ (Clk) #50 Clk <= ~Clk;

    PushDownStack Stack_Inst(
        .Rst(Rst),
        .PushPop(PushPop),
        .En(En),
        .data_i(data_i),
        .data_o(data_o),
        .empty(empty),
        .full(full),
        .Clk(Clk)
    );
endmodule
