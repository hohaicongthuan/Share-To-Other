module Comparator (A_i, B_i, equal_o);

    // declare ports
    input [9:0] A_i;
    input [9:0] B_i;
    output equal_o;
    // output greater_o, lesser_o;

    // declare data type of ports: all are wires so no need any code

    // declare wires
    wire [9:1] connect_Ro_Ri;
    wire [9:0] Do_result;
    wire Ri_gnd;
    wire Ro_out;
    assign Ri_gnd = 1'b0;

    // function description
    FullSubtractor FullSubtractor_inst [9:0] (
        .A_i(A_i),
        .B_i(B_i),
        .Ri_i({connect_Ro_Ri[9:1], Ri_gnd}),
        .D_o(Do_result [9:0]),
        .Ro_o({Ro_out, connect_Ro_Ri[9:1]})
    );

    nor(equal_o, 
	 Do_result [9], 
	 Do_result [8], 
	 Do_result [7], 
	 Do_result [6],
	 Do_result [5],
	 Do_result [4],
	 Do_result [3],
	 Do_result [2],
	 Do_result [1],
	 Do_result [0]);
    
endmodule