module Select_and_encode #(parameter DATA_WIDTH = 32)(
    input [DATA_WIDTH-1:0] IR,
    input Gra, Grb, Grc, Rin, Rout, BAout,
    output reg R0in, R1in, R2in, R3in, 
			  R4in, R5in, R6in, R7in, 
			  R8in, R9in, R10in, R11in, 
			  R12in, R13in, R14in, R15in,
	 
	 output reg R0out, R1out, R2out, R3out, 
			  R4out, R5out, R6out, R7out, 
			  R8out, R9out, R10out, R11out, 
			  R12out, R13out, R14out, R15out,
				  
    output reg [DATA_WIDTH-1:0] C_sign_extended,
	 output [4:0] opcode
);

    wire [3:0] Ra, Rb, Rc;
    reg [2:0] SelectedReg;
	 reg [3:0] selectedDecoder;

	 assign opcode = IR[31:27];
    assign Ra = IR[26:23];
    assign Rb = IR[22:19];
    assign Rc = IR[18:15];
	 
	 reg [3:0] OrInputRa;
	 reg [3:0] OrInputRb;
	 reg [3:0] OrInputRc;
	 reg [3:0] DecoderInput;
	 reg [15:0] RinSignals;
	 reg [15:0] RoutSignals;
	 
	 integer i;
	 
always @(*) begin
		OrInputRa = 4'b0;
		OrInputRb = 4'b0;
		OrInputRc = 4'b0;
		DecoderInput = 4'b0;
		RinSignals = 16'b0;
		RoutSignals = 16'b0;
		
		for (i = 0; i < 4; i = i + 1) 
		begin
			OrInputRa[i] = Ra[i] & Gra;
			OrInputRb[i] = Rb[i] & Grb;
			OrInputRc[i] = Rc[i] & Grc;
		end		
	
		DecoderInput = OrInputRa | OrInputRb | OrInputRc;
	
		if (Rin==1) begin 
		
			RinSignals = RinSignals ^ (16'h1 << DecoderInput);
			
			case (RinSignals)
			16'h1: begin
				R0in = 1;
			end
			16'h2: begin
				R1in = 1;
			end
			16'h4: begin
				R2in = 1;
			end
			16'h8: begin
				R3in = 1;
			end
			16'h10: begin
				R4in = 1;
			end
			16'h20: begin
				R5in = 1;
			end
			16'h40: begin
				R6in = 1;
			end
			16'h80: begin
				R7in = 1;
			end
			16'h100: begin
				R8in = 1;
			end
			16'h200: begin
				R9in = 1;
			end
			16'h400: begin
				R10in = 1;
			end
			16'h800: begin
				R11in = 1;
			end
			16'h1000: begin
				R12in = 1;
			end
			16'h2000: begin
				R13in = 1;
			end
			16'h4000: begin
				R14in = 1;
			end
			16'h8000: begin
				R15in = 1;
			end
			endcase
		end
		
		if (Rout==1 | BAout==1) begin
		
			RoutSignals = RoutSignals ^ (16'h1 << DecoderInput);
			
			case (RoutSignals)
			16'h1: begin
				R0out = 1;
			end
			16'h2: begin
				R1out = 1;
			end
			16'h4: begin
				R2out = 1;
			end
			16'h8: begin
				R3out = 1;
			end
			16'h10: begin
				R4out = 1;
			end
			16'h20: begin
				R5out = 1;
			end
			16'h40: begin
				R6out = 1;
			end
			16'h80: begin
				R7out = 1;
			end
			16'h100: begin
				R8out = 1;
			end
			16'h200: begin
				R9out = 1;
			end
			16'h400: begin
				R10out = 1;
			end
			16'h800: begin
				R11out = 1;
			end
			16'h1000: begin
				R12out = 1;
			end
			16'h2000: begin
				R13out = 1;
			end
			16'h4000: begin
				R14out = 1;
			end
			16'h8000: begin
				R15out = 1;
			end
			endcase
		end
		
		C_sign_extended = {{14{IR[18]}}, IR[18:0]};
		
	end
endmodule
