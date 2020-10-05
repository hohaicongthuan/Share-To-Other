`timescale 1ns/100ps

module SRwPR_tb ();

reg [7:0] DATA;
reg [2:0] s;
reg CLK,Sl,Sr;

wire [7:0] Yo;
parameter n=10;

SRwPR unit1 (
               .In(DATA),
               .sl(Sl), 
               .sr(Sr), 
               .S(s), 
               .Y(Yo), 
               .clk(CLK)
              );

initial begin

  #0 CLK=1;

 #20;
  s=2'b01;
  Sr=0;
  Sl=0;
  DATA=8'd58;
 
   #40;
  s=2'b10;
  Sr=0;
  Sl=1;

  #40;
  s=2'b11;
  Sr=1;
  Sl=0;
  #40 $finish;

end

always #n CLK <= ~CLK;
endmodule 