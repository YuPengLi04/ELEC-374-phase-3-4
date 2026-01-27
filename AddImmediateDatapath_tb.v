`timescale 1ns/10ps
module AddImmediateDatapath_tb;

  reg Zout, R0out, Rout, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout;
  reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin, Rin, ZhighIn, ZlowIn;
  reg IncPC, Read, Gra, Grb, Grc;
  reg clock, clear;

  parameter  Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
                       Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, Reg_load4a = 4'b0111,
                       T0 = 4'b1000, T1 = 4'b1001, T2 = 4'b1010, T3 = 4'b1011, T4 = 4'b1100, T5 = 4'b1101, T6 = 4'b1110;
  reg [3:0] Present_state = Default;

  DataPath DUT(clock, clear, Gra, Grb, Grc, Zout, R0out, Rout, HIout, LOout, Zhighout, Zlowout, 
				  PCout, MDRout, InPortout, Cout, Zin, Yin, Rin, PCin, IRin, HIin, LOin, MARin,
				  MDRin, Read, ZhighIn, ZlowIn);

initial
begin
  clear = 0;
  clock = 0;
  forever #10 clock = ~clock;
end

always@(posedge clock)
  begin
    case(Present_state)
      Default : Present_state = Reg_load1a;
      Reg_load1a : Present_state = Reg_load1b;
      Reg_load1b : Present_state = Reg_load2a;
      Reg_load2a : Present_state = Reg_load2b;
      Reg_load2b : Present_state = Reg_load3a;
      Reg_load3a : Present_state = Reg_load3b;
      Reg_load3b : Present_state = Reg_load4a;
		Reg_load4a : Present_state = T0;
      T0 : Present_state = T1;
      T1 : Present_state = T2;
      T2 : Present_state = T3;
      T3 : Present_state = T4;
      T4 : Present_state = T5;
		T5 : Present_state = T6;
    endcase
  end
  
always@(Present_state)
  begin
    case(Present_state)
      Default: begin
          Gra<=0; Grb<=0; Grc<=0; Zout<=0; R0out<=0;
			 Rout<=0; HIout<=0; LOout<=0; Zhighout<=0; 
			 Zlowout<=0; PCout<=0; MDRout<=0; InPortout<=0;
			 Cout<=0; Zin<=0; Yin<=0; Rin<=0; PCin<=0;
			 IRin<=0; HIin<=0; LOin<=0; MARin<=0;
			 MDRin<=0; Read<=0; ZhighIn<=0; ZlowIn<=0;
      end/*
      Reg_load1a: begin
		    Read<=1; MDRin<=1;
			 $readmemh("instructions.hex", DUT.ram1.mem); //instruction.hex is a file that only has hex values
          Mdatain<=32'h00000022; //all Mdatain needs to be changed to ^
      end
      Reg_load1b: begin
	       Read<=0; MDRin<=0;
          MDRout<=1; R3in<=1;
      end
      Reg_load2a: begin
		    MDRout<=0; R3in<=0; // initialize R3 with value 0x22
	      
	       Read<=1; MDRin<=1;
          Mdatain<=32'h00000024;
      end
      Reg_load2b: begin
	       Read<=0; MDRin<=0;
          MDRout<=1; R7in<=1;
      end
      Reg_load3a: begin 
	       MDRout<=0; R7in<=0; //initialize R7 with value 0x24
	      
		    Read<=1; MDRin<=1;
          Mdatain<=32'h00000028;
      end
      Reg_load3b: begin
	       Read<=0; MDRin<=0;
          MDRout<=1; R4in<=1;
      end
      Reg_load4a: begin
			 MDRout<=0; R4in<=0; //initialize R4 with the value 0x28
		    PCout<=1; MARin<=1; ZlowIn<=1; // increment counter
      end
      T0: begin
			 PCout<=0; MARin<=0; ZlowIn<=0;
			 Zlowout<=1; PCin<=1; 
      end
      T1: begin
			 Zlowout<=0; PCin<=0;
			 Read<=1; MDRin<=1;
          Mdatain<=32'h221B8000;  //opcode for "add r4,r3,r7" = 32'h1A1B8000
      end
      T2: begin
          Read<=0; MDRin<=0;
          MDRout<=1; IRin<=1;
      end
      T3: begin
          MDRout<=0; IRin<=0;
          Gra<=1; Yin<=1;
      end
      T4: begin
			 R3out<=0; Yin<=0;
          R7out<=1; ZlowIn<=1; // do alu instruction
	   end
      T5: begin
          R7out<=0; ZlowIn<=0;
          Zlowout<=1; R4in<=1;
      end
		T6: begin
			 Zlowout<=0; R4in<=0;
		end*/
    endcase
  end
endmodule
