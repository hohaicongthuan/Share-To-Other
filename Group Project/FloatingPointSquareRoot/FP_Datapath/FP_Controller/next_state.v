module next_state(CurrentState_i, negative, NextState_o);
    parameter S0 = 4'd0;
    parameter S1 = 4'd1;
    parameter S2 = 4'd2;
    parameter S3 = 4'd3;
    parameter S4 = 4'd4;
    parameter S5 = 4'd5;
    parameter S6 = 4'd6;
    parameter S7 = 4'd7;
    parameter S8 = 4'd8;
    parameter S9 = 4'd9;
    parameter S10 = 4'd10;
    
    input [3:0] CurrentState_i;
    input negative;
    output reg [3:0] NextState_o;

    always @(CurrentState_i, negative) begin
        case (CurrentState_i)
        S0: NextState_o = S1;
        S1: NextState_o = S2;
        S2: NextState_o = S3;
        S3: NextState_o = S4;
        S4: NextState_o = S5;
        S5: NextState_o = S6;
        S6: NextState_o = S7;
        S7: NextState_o = S8;
        S8: NextState_o = S9;
        S9: NextState_o = (negative == 1'b1) ? S10 : S3;
        S10: NextState_o = S0;

        default
            begin
                NextState_o = S0;
            end
        endcase
    end
endmodule