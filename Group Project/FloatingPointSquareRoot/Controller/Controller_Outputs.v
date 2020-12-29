module Controller_Outputs(CurrentState, data_o);
    parameter   S0  = 6'd0,     S1  = 6'd1,      S2 = 6'd2,
                S3  = 6'd3,     S4  = 6'd4,      S5 = 6'd5,
                S6  = 6'd6,     S7  = 6'd7,      S8 = 6'd8,
                S9  = 6'd9,     S10 = 6'd10,    S11 = 6'd11,
                S12 = 6'd12,    S13 = 6'd13,    S14 = 6'd14,
                S15 = 6'd15,    S16 = 6'd16,    S17 = 6'd17,
                S18 = 6'd18,    S19 = 6'd19,    S20 = 6'd20,
                S21 = 6'd21,    S22 = 6'd22,    S23 = 6'd23,
                S24 = 6'd24,    S25 = 6'd25,    S26 = 6'd26,
                S27 = 6'd27,    S28 = 6'd28,    S29 = 6'd29,
                S30 = 6'd30,    S31 = 6'd31,    S32 = 6'd32,
                S33 = 6'd33,    S34 = 6'd34,    S35 = 6'd35,
                S36 = 6'd36,    S37 = 6'd37,    S38 = 6'd38,
                S39 = 6'd39,    S40 = 6'd40,    S41 = 6'd41,
                S42 = 6'd42,    S43 = 6'd43,    S44 = 6'd44,
                S45 = 6'd45,    S46 = 6'd46,    S47 = 6'd47,
                S48 = 6'd48,    S49 = 6'd49,    S50 = 6'd50;
    
    input   	[5:0] CurrentState;
    output reg [13:0] data_o;

    always @ (CurrentState) begin
        case (CurrentState)
            S0: data_o      =    14'b00000000000000;    // Initial state
            S1: data_o      =    14'b11001000000000;    // Input n
            S2: data_o      =    14'b01010001000000;    // x = n
            
            // Iteration 1
            S3: data_o      =    14'b01011001010100;    // root = n / x
            S4: data_o      =    14'b01011011010000;    // root = root + x
            S5: data_o      =    14'b01011011101100;    // root = root / 2
            S6: data_o      =    14'b01010011000000;    // x = root

            // Iteration 2
            S7: data_o      =    14'b01011001010100;    // root = n / x
            S8: data_o      =    14'b01011011010000;    // root = root + x
            S9: data_o      =    14'b01011011101100;    // root = root / 2
            S10: data_o      =    14'b01010011000000;   // x = root

            // Iteration 3
            S11: data_o      =    14'b01011001010100;   // root = n / x
            S12: data_o      =    14'b01011011010000;   // root = root + x
            S13: data_o      =    14'b01011011101100;   // root = root / 2
            S14: data_o      =    14'b01010011000000;   // x = root

            // Iteration 4
            S15: data_o      =    14'b01011001010100;   // root = n / x
            S16: data_o      =    14'b01011011010000;   // root = root + x
            S17: data_o      =    14'b01011011101100;   // root = root / 2
            S18: data_o      =    14'b01010011000000;   // x = root

            // Iteration 5
            S19: data_o      =    14'b01011001010100;   // root = n / x
            S20: data_o      =    14'b01011011010000;   // root = root + x
            S21: data_o      =    14'b01011011101100;   // root = root / 2
            S22: data_o      =    14'b01010011000000;   // x = root

            // Iteration 6
            S23: data_o      =    14'b01011001010100;   // root = n / x
            S24: data_o      =    14'b01011011010000;   // root = root + x
            S25: data_o      =    14'b01011011101100;   // root = root / 2
            S26: data_o      =    14'b01010011000000;   // x = root

            // Iteration 7
            S27: data_o      =    14'b01011001010100;   // root = n / x
            S28: data_o      =    14'b01011011010000;   // root = root + x
            S29: data_o      =    14'b01011011101100;   // root = root / 2
            S30: data_o      =    14'b01010011000000;   // x = root

            // Iteration 8
            S31: data_o      =    14'b01011001010100;   // root = n / x
            S32: data_o      =    14'b01011011010000;   // root = root + x
            S33: data_o      =    14'b01011011101100;   // root = root / 2
            S34: data_o      =    14'b01010011000000;   // x = root

            // Iteration 9
            S35: data_o      =    14'b01011001010100;   // root = n / x
            S36: data_o      =    14'b01011011010000;   // root = root + x
            S37: data_o      =    14'b01011011101100;   // root = root / 2
            S38: data_o      =    14'b01010011000000;   // x = root

            // Iteration 10
            S39: data_o      =    14'b01011001010100;   // root = n / x
            S40: data_o      =    14'b01011011010000;   // root = root + x
            S41: data_o      =    14'b01011011101100;   // root = root / 2
            S42: data_o      =    14'b01010011000000;   // x = root

            // Iteration 11
            S43: data_o      =    14'b01011001010100;   // root = n / x
            S44: data_o      =    14'b01011011010000;   // root = root + x
            S45: data_o      =    14'b01011011101100;   // root = root / 2
            S46: data_o      =    14'b01010011000000;   // x = root

            // Iteration 12
            S47: data_o      =    14'b01011001010100;   // root = n / x
            S48: data_o      =    14'b01011011010000;   // root = root + x
            S49: data_o      =    14'b01011011101100;   // root = root / 2

            // Output
            S50: data_o     =    14'b00111011000001;    //Output value of root
            default: data_o =    14'b00000000000000;
        endcase
    end
endmodule