module sr_latch_gated(Q, Qn, G, S, R);
   output Q;
   output Qn;
   input  G;   
   input  S;
   input  R;

   wire   S1;
   wire   R1;
   
   and(S1, G, S);
   and(R1, G, R);   
   nor(Qn, S1, Q);
   nor(Q, R1, Qn);
endmodule // sr_latch_gated