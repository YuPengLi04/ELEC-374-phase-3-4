module CON_FF #(parameter DATA_WIDTH = 32)(
    input wire clk,                       // Clock signal
    input wire [DATA_WIDTH-1:0] IRdata,
	 input wire [DATA_WIDTH-1:0]BusMuxOut,
    output reg branch_output					// Data output (used for reading)
);

	 wire bus_nor, bus_or, bus_not, bus_data;
	 wire s1, s2, s3, s4, s5;
	 
	 wire [3:0] decoder;
	 assign decoder = IRdata [22:19];
	  
	 assign bus_nor = ~|BusMuxOut;
	 assign bus_or = |BusMuxOut;
	 assign bus_not = ~BusMuxOut[31];
	 assign bus_data = BusMuxOut[31];
	 
    assign s1 = bus_nor & decoder[0]; 
    assign s2 = bus_or  & decoder[1]; 
    assign s3 = bus_not & decoder[2]; 
    assign s4 = bus_data & decoder[3]; 
    assign s5 = s1 | s2 | s3 | s4;
	 
	 always @(posedge clk) begin
		branch_output <= s5;
    end

endmodule
