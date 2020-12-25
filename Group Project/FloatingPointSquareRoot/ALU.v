module ALU(data_iA, data_iB, data_o, flg_negative, flg_zero);
    parameter   BUS_WIDTH = 32;
    
    input       [BUS_WIDTH - 1: 0] data_iA, data_iB;
    output      [BUS_WIDTH - 1: 0] data_o;
    output      flg_negative, flg_zero;

    assign flg_negative = data_o[31] ? 1'b1 : 1'b0;
    assign flg_zero     = (data_o[30:0] == 31'd0) ? 1'b1 : 1'b0;
    
endmodule