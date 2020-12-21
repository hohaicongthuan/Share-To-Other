module register_controller(clk,data_i,data_o);

parameter DATA_WITDH = 32;

// Declare port type
input clk;
input [DATA_WITDH - 1:0] data_i;
output [DATA_WITDH - 1:0] data_o;

// mssv co 8 trang thai nen chi can 3 FF => data_i can 3 bit
// viet [2:0] chu khong phai [0:2]

// Declare data type for ports

// wire: day noi, luon danh cho: input
// reg: thanh ghi, dung de luu tru, bao gom ca wire va register.
	// Bat buoc la kieu register neu la thanh ghi (dung de luu gia tri)
	// La kieu wire khi su dung register de gan gia tri
	// flipflop output luon la kieu reg.
	
wire clk;
wire [DATA_WITDH - 1:0] data_i;
reg [DATA_WITDH - 1:0] data_o;

// Functional Description
// always la cau lenh de thuc thi, no se thu thi trong begin end
// dieu khien thuc thi la @()
// posedge: tich cuc canh len, negede tich cuc canh xuong
// code cua verilog chay song song chu ko phai tu tren xuong => cac phep gan "<=" co the lay so tu gia tri cu. con phep "=" thi bat buoc bang gia tri moi.
// mach tuan tu luon xai "<="

always @(posedge clk) 
begin	
		data_o <= data_i;
end

endmodule