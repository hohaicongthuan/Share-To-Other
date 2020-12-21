// RegisterFile 8 regs 16 bit

module RegisterFile(data_i, addr_wr_i, WE_i, addr_rda_i, addr_rdb_i, clk, RDA_o, RDB_o,
							Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7
							);
	parameter DATA_WITDH=32;
	parameter ADDR_WIDTH=3;
    // Declare port type
   input [(DATA_WITDH-1):0] data_i;
   input WE_i, clk;
   input [(ADDR_WIDTH-1):0] addr_wr_i;
   input [(ADDR_WIDTH-1):0] addr_rda_i;
   input [(ADDR_WIDTH-1):0] addr_rdb_i;
   output [(DATA_WITDH-1):0] RDA_o;
   output [(DATA_WITDH-1):0] RDB_o;
	output [(DATA_WITDH-1):0] Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7;

    // Declare data type for ports (not include here means wire by default)
     
    // Internal wires declaration
    reg [(DATA_WITDH-1):0] RF [2**ADDR_WIDTH-1:0];
	 wire [(ADDR_WIDTH-1):0] addr_rda_i;
	 wire [(ADDR_WIDTH-1):0] addr_rdb_i;
     
    // Functional Description
   always @(posedge clk) 
    begin    
		  if (WE_i)
				RF[addr_wr_i] <= data_i;
			
    end
    
	 assign RDA_o = RF[addr_rda_i];
	 assign RDB_o = RF[addr_rdb_i];
	 assign Reg_0 = RF[0];
	 assign Reg_1 = RF[1];
	 assign Reg_2 = RF[2];
	 assign Reg_3 = RF[3];
	 assign Reg_4 = RF[4];
	 assign Reg_5 = RF[5];
	 assign Reg_6 = RF[6];
	 assign Reg_7 = RF[7];
	 

endmodule