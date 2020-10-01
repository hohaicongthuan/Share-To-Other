// Ex2

module EightbitShifterwParallelLoad(data_o, data_i, dataR_i, dataL_i, select1_i, select2_i, clk);

    // parameters
    parameter BUS_WIDTH = 8; // Define bus width here

    // Declare port type
    input [BUS_WIDTH - 1:0] data_i;
    input select1_i, select2_i, dataR_i, dataL_i, clk;
    output [BUS_WIDTH - 1:0] data_o;

    // Declare data type for ports
    wire [BUS_WIDTH - 1:0] data_i;
    wire select1_i, select2_i, dataR_i, dataL_i;
    wire [BUS_WIDTH - 1:0] data_o;

    // Internal wires declaration
    wire [BUS_WIDTH - 1:0] mux_o;
    wire [BUS_WIDTH - 1:0] mux_wire;

    // Functional Description
    Mux4_1 Mux4_1_inst [BUS_WIDTH - 1:0]  (
        .dataA_i(mux_wire[BUS_WIDTH - 1:0]),                // cổng 0 ở mỗi selector nối với wire mux đúng thứ tự Q của DFF
        .dataB_i(data_i [BUS_WIDTH - 1:0]),                 // cổng 1 ở mỗi selector nối với các input
        .dataC_i({
            mux_wire[BUS_WIDTH - 2:0],                      // cổng 2 của các selector khác cuối nối với wire mux cách họ 1 con mux
            dataR_i}),                                      // cổng 2 của selector cuối cùng [0] nối với dataR_i   
        
        .dataD_i({
            dataL_i,                                        // cổng 3 của selector 3 nối với dataL_i, còn lại nối với wire mux
            mux_wire[BUS_WIDTH - 1:1]                       // cổng 3 của các selector còn lại nối với wire mux đúng thứ tự Q của DFF
            }),   
        
        .select1_i(select1_i),
        .select2_i(select2_i),
        .data_o(mux_o [BUS_WIDTH - 1:0])
    );

    DFlipFlop DFlipFlop_inst [BUS_WIDTH - 1:0] (
        .Q(mux_wire[BUS_WIDTH - 1:0]),
        .D(mux_o [BUS_WIDTH - 1:0]),
        .clk(clk)
    );

    // still need output Q as reg
	assign data_o[BUS_WIDTH - 1:0] = mux_wire[BUS_WIDTH - 1:0];
	
endmodule
