`timescale 1ns/1ps

module Testbench();
    reg Rst, PushPop, En, Clk;
    reg [7:0] data_i;
    wire [7:0] data_o;
    wire empty, full;
    
    parameter waittime = 50;
    
    initial begin
        Rst = 0;
        PushPop = 0;
        En = 0;
        data_i = 0;
        #waittime;
        Rst = 1'b1;
        En = 1'b1;
        data_i = 8'd115;
        #waittime;
        En = 1'b0;
        #waittime;
        data_i = 8'd123;
        En = 1'b1;
        #waittime;
        En = 1'b0;
        #waittime;
        PushPop = 1'b1;
        En = 1'b1;
        #waittime; #waittime;
        //#2000 $finish;
    end

    always @ (Clk) #50 Clk <= ~Clk;

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
