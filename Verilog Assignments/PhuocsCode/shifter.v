module shifter (Ish, Il, Ir,s, clk, Yo);

//ioports 
input Ish, Il, Ir, clk;
input [1:0] s;
output Yo;

//internal net
//wire DtoMux;
wire MuxtoD;
wire qn;
//description
dff1 Dff_0 ( .clk(clk),
             .datin(MuxtoD),
				 .datout(Yo),
		       .Qn(qn)
				 );
				 
mux4to1 mux4to1_0 (
                   .I0(Yo),
						 .I1(Ish),
						 .I2(Ir),
						 .I3(Il),
						 .s0(s[0]),
						 .s1(s[1]),
						 .q(MuxtoD)
                  );

endmodule 