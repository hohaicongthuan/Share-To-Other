module Queue(Rst_i, Clk_i, En_i, RW_i, data_o, data_i, empty_o, full_o);
    // declare ports
    input Rst_i, Clk_i, En_i, RW_i;
    input [7:0] data_i;
    output [7:0] data_o;
    output empty_o, full_o;

    // declare data type of ports, the one without declares are wires by default
    reg [7:0] data_o;

    // declare wires
    wire front_e;       // wire that connect to enable of front counter
    wire back_e;       // wire that connect to enable of back counter
    wire not_RW_i;      // not of RW_i
    wire Comparator_equal;  // output equal of comparator
    wire xor_o;         // output of xor
    wire not_xor_o;     // not of output of xor
    wire [7:0] front_result;  // output of front counter
    wire [7:0] back_result;   // output of back counter
    wire [7:0] RAM_A;         // wire that connect to input A of RAM

    // wire function
    not(not_RW_i, RW_i);
    and(front_e, not_RW_i, En_i);
    and(back_e, RW_i, En_i);

    xor(xor_o, front_result[7], back_result[7]);
    not(not_xor_o,xor_o);
    and(empty_o, Comparator_equal, not_xor_o);
    and(full_o, Comparator_equal, xor_o);

    // function description
    UpDownCounterwRst UpDownCounterwRst_inst [1:0] (
        .D(1'b0),
        .En({front_e,back_e}),
        .Clk(Clk_i),
        .PreN(),
        .ClrN(Rst_i),
        .Out({front_result [7:0], back_result [7:0]}),
        .Cout()
    );

    Mux2_1 Mux2_1_inst (
        .dataA_i(back_result [7:0]),
        .dataB_i(front_result [7:0]),
        .select_i(front_e),
        .data_o(RAM_A [7:0])
    );

    Comparator Comparator_inst (
        .A_i(back_result [7:0]),
        .B_i(front_result [7:0]),
        .equal_o(Comparator_equal)
    );

    RAM RAM_inst (
        .addr_i(RAM_A [7:0]),
        .WEn_i(back_e),
        .data_i(data_i [7:0]),
        .data_o(data_o [7:0])
    );

endmodule