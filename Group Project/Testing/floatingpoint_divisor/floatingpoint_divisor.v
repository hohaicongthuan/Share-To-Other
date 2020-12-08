module floatingpoint_divisor(s1,s2,e1,e2,f1,f2,s3,f3,e3);
    input s1,s2;
    input [7:0] e1,e2;
    input [23:0] f1,f2;

    output s3;
    output [7:0] e3;
    output [23:0] f3;

    // wires
    wire [7:0] sub_o;
    // wire sub15_o;

    // functions
    xor(s3,s1,s2);

    integer_subtractor integer_subtractor_inst0 (
    .sobitru_i(e1),
    .sotru_i(e2), 
    .data_o(sub_o)
    );

    integer_sub_15 integer_sub_15_inst0 (
    .data_i(sub_o), 
    .data_o(e3)
    );

    integer_division integer_division_inst0 (
    .dividend_i(f1), 
    .divisor_i(f2), 
    .quotient_o(f3)
    );

endmodule