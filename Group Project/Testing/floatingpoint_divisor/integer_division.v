module integer_division(dividend_i, divisor_i, quotient_o);
    parameter DATA_WIDTH = 24;
    input [DATA_WIDTH - 1:0] dividend_i;    // so bi chia
    input [DATA_WIDTH - 1:0] divisor_i;     // so chia
    output [DATA_WIDTH - 1:0] quotient_o;   // thuong

    assign quotient_o = dividend_i / divisor_i;
endmodule