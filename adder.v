// Ripple Carry Adder   should change the name at a later time
module adder #(parameter DATA_WIDTH = 32)(A, B, Result);

// sub if 1 its subtract, 0 if its add

input [DATA_WIDTH-1:0] A, B;
output [DATA_WIDTH-1:0] Result;

reg [DATA_WIDTH-1:0] Result;
reg [32:0] LocalCarry;

integer i;

always@(A or B)
	begin
		LocalCarry = 33'd0;
		for(i = 0; i < 32; i = i + 1)
		begin
				Result[i] = A[i]^B[i]^LocalCarry[i];
				LocalCarry[i+1] = (A[i]&B[i])|(LocalCarry[i]&(A[i]|B[i]));
		end
	end
endmodule
