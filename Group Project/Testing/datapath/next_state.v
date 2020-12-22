module next_state(CurrentState_i, negative, NextState_o);
    parameter S0 = 0000;
    parameter S1 = 0001;
    parameter S2 = 0010;
    parameter S3 = 0011;
    parameter S4 = 0100;
    parameter S5 = 0101;
    parameter S6 = 0110;
    parameter S7 = 0111;
    parameter S8 = 1000;
    parameter S9 = 1001;
    parameter S10 = 1010;
    
    input [3:0] CurrentState_i;
    input negative;
    output [3:0] NextState_o;

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

    end
endmodule