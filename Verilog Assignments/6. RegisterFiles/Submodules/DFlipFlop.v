// D flip-flop
// Q_N = complement of Q

module DFlipFlop(Q, Q_N, D, clk);
    input D, clk;
    output Q, Q_N;

    // Internal wires declaration
    wire w1, w2, w3, w4, D_N;    // D_N = complement of D

    not(D_N, D);
    nand(w1, D, clk);
    nand(w2, D_N, clk);
    nand(Q, Q_N, w1);
    nand(Q_N, Q, w2);

endmodule