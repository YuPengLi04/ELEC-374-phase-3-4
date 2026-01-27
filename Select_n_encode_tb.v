`timescale 1ns/10ps
module Select_n_encode_tb;
  
  reg [31:0] IRdataOut;
  wire [31:0] C_sign_extended;
  reg IR, Rout,Rin, Gra, Grb, Grc, BAout, RinSignals, RoutSignals;
  reg clock, clear;

  parameter  Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
                       Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110;
  
  reg [3:0] Present_state = Default;
  
  Select_and_encode CUT(IRdataOut, Gra, Grb, Grc, Rin, Rout, BAout, R0in, R1in, R2in, R3in, 
			  R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
			  R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,  R8out, R9out, R10out, R11out, 
			  R12out, R13out, R14out, R15out, C_sign_extended);
  
initial begin
  clear = 0;
  clock = 0;
  IRdataOut = 32'h00000000;
end

always #10 clock = ~clock;

always@(posedge clock) begin
    case(Present_state)
      Default : Present_state = Reg_load1a;
      Reg_load1a : Present_state = Reg_load1b;
      Reg_load1b : Present_state = Reg_load2a;
      Reg_load2a : Present_state = Reg_load2b;
      Reg_load2b : Present_state = Reg_load3a;
      Reg_load3a : Present_state = Reg_load3b;
    endcase
end

always@(Present_state) begin
    case(Present_state)
      Default: begin
          Rout<=0; Rin<=0; Gra<=0;
          Grb<=0; Grc<=0;
          BAout<=0; IRdataOut<=32'h2A1B8000;
      end
      Reg_load1a: begin
		    Rin<=1; Gra<=1;
      end
      Reg_load1b: begin
		    Gra<=0; Grb<=1;
      end
		Reg_load2a: begin
			 Grb<=0; Grc<=1;
      end
		Reg_load2b: begin
			 Rin<=0; Grc<=0;
			 Rout<=1; Gra<=1;
      end
		Reg_load3a: begin
			 Gra<=0; Grb<=1;
      end
		Reg_load3b: begin
			 Grb<=0; Grc<=1;
      end
	endcase
end
endmodule
