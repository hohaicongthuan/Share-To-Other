`timescale 1ns/1ps

module Testbench();
    reg Rst, RW, En, Clk;
    reg [7:0] data_i;
    wire [7:0] data_o;
    wire empty, full;
    
    parameter waittime = 50;
    
    initial begin
        Rst = 0;
        RW = 0;
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
        RW = 1'b1;
        En = 1'b1;
        #waittime; #waittime;
        //#2000 $finish;
    end

    always @ (Clk) #50 Clk <= ~Clk;

    Queue Queue_Inst(
        .Rst_i(Rst),
        .RW_i(RW),
        .En_i(En),
        .data_i(data_i),
        .data_o(data_o),
        .empty_o(empty),
        .full_o(full),
        .Clk_i(Clk)
    );
endmodule
