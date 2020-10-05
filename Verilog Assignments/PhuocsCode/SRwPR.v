
module SRwPR (In,sl, sr, S, Y, clk);

//ioports
input wire [7:0] In;
input wire [1:0] S;
input  wire clk,sl,sr;
output wire [7:0]Y;

//internal net


//description
shifter shifter_0 ( .Ish(In[0]), 
                    .Il(Y[1]), 
						  .Ir(sl),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[0])
                  );
shifter shifter_1(.Ish(In[1]), 
                    .Il(Y[2]), 
						  .Ir(Y[0]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[1])
                   );
shifter shifter_2( .Ish(In[2]), 
                    .Il(Y[3]), 
						  .Ir(Y[1]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[2])
                   );
shifter shifter_3( .Ish(In[3]), 
                    .Il(Y[4]), 
						  .Ir(Y[2]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[3])
                   );
shifter shifter_4(.Ish(In[4]), 
                    .Il(Y[5]), 
						  .Ir(Y[3]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[4])
                   );
shifter shifter_5( .Ish(In[5]), 
                    .Il(Y[6]), 
						  .Ir(Y[4]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[5])
                   );
shifter shifter_6( .Ish(In[6]), 
                    .Il(Y[7]), 
						  .Ir(Y[5]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[6])
                   );
shifter shifter_7( .Ish(In[7]), 
                    .Il(sr), 
						  .Ir(Y[6]),
						  .s(S), 
						  .clk(clk),
						  .Yo(Y[7])
                   );
endmodule