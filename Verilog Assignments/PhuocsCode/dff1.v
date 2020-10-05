module dff1(datout, Qn, clk, datin);
   output datout;
   output Qn;
   input  clk;
   input  datin;

   wire   Cn;   // Control input to the D latch.
   wire   Cnn;  // Control input to the SR latch.
   wire   DQ;   // Output from the D latch, input to the gated SR latch.
   wire   DQn;  // Output from the D latch, input to the gated SR latch.
   
   not(Cn, clk);
   not(Cnn, Cn);   
   d_latch dl(DQ, DQn, Cn, datin);
   sr_latch_gated sr(datout, Qn, Cnn, DQ, DQn);   
endmodule // d_flip_flop_edge_triggered