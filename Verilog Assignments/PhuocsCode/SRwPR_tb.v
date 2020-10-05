module SRwPR_tb ();

reg [7:0] DATA;
reg [2:0] s;
reg CLK,Sl,Sr;

wire [7:0] Yo;


SRwPR unit1 (
               .In(DATA),
               .sl(Sl), 
               .sr(Sr), 
               .S(s), 
               .Y(Yo), 
               .clk(CLK)
              );

initial begin
  s=2'b01;
  Sr=0;
  Sl=0;
  DATA=8'd58;
  #20;
 
  s=2'b10;
  Sr=1;
  Sl=0;
  #20;

  s=2'b11;
  Sr=0;
  Sl=1;
  #40; $finish;

end

always @(CLK) #10 CLK <= ~CLK;
endmodule 