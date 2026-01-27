module register_zero #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'b0)(
	input clear, clock, enable, BAout,
	input [DATA_WIDTH_IN-1:0]BusMuxOut,
	output wire [DATA_WIDTH_OUT-1:0]BusMuxIn
);
reg [DATA_WIDTH_IN-1:0]q;
reg [1:0]BAout_inverse;

initial q = INIT;
always @ (posedge clock)
		begin 
			BAout_inverse <= ~BAout; 
			if (clear) begin
				q <= {DATA_WIDTH_IN{1'b0}};
			end
			else if (enable) begin
				q <= BusMuxOut;
			end
		end
	assign BusMuxIn = BAout_inverse & q[DATA_WIDTH_OUT-1:0];
	
endmodule
