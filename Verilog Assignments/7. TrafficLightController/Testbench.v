`timescale 1ns/1ps
module Testbench();
	reg clk;
	reg [5:0] ShortTime_i, LongTime_i;
	wire HR, HY, HG, FR, FY, FG;

	initial begin
		forever #20 clk = ~clk;
		ShortTime_i = 6'd3;
		LongTime_i = 6'd5;
		#2000 $finish;
	end

TrafficLightController TrafficLightController_inst0(
	.clk(clk),
	.ShortTime_i(ShortTime_i),
	.LongTime_i(LongTime_i),
	.HG(HG),
	.HY(HY),
	.HR(HR),
	.FG(FG),
	.FY(FY),
	.FR(FR)
);

endmodule