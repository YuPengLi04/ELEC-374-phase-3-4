`timescale 1ns / 1ns
module Load_tb;

  reg Zout, Rout, HIout, LOout, Zhighout, Zlowout, 
      PCout, MDRout, InPortout, Cout;    
  reg MARin, Zin, PCin, MDRin, IRin, Yin;
  reg Gra, Grb, Grc, Rin;
  reg Read, IncPC, HIin, LOin, ZhighIn, ZlowIn, BAout, IRout;
  reg clock, clear;
  
  reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, 
      R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
  reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, 
      R10in, R11in, R12in, R13in, R14in, R15in;

  reg [31:0] Mdatain;  // Ensure Mdatain is 32 bits
  reg [4:0] opcode;    // Ensure opcode is 5 bits

  // State encoding
  parameter Default = 4'b0000, T0 = 4'b0001, T1a = 4'b0010, T1b = 4'b0011,
            T2 = 4'b0100, T3 = 4'b0101, T4 = 4'b0110, T5 = 4'b0111, 
            T6 = 4'b1000, T7 = 4'b1001;
  reg [3:0] Present_state = Default;

  // Instantiate the DataPath module
  DataPath DUT (
    clock, clear, Gra, Grb, Grc, Zout, 
    R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, 
    R9out, R10out, R11out, R12out, R13out, R14out, R15out, Rout, HIout, 
    LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout, Zin, 
    R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, 
    R11in, R12in, R13in, R14in, R15in, Yin, Rin, PCin, IRin, HIin, LOin, 
    MARin, MDRin, Read, ZhighIn, ZlowIn, BAout, Mdatain, opcode
  );



  initial begin
    clock = 0;
    clear = 0;
    forever #10 clock = ~clock;
  end

  // State transition logic
  always @(posedge clock) begin
    if (clear)
      Present_state <= Default;
    else begin
      case (Present_state)
        Default: Present_state <= T0;
        T0: Present_state <= T1a;
        T1a: Present_state <= T1b;
        T1b: Present_state <= T2;
        T2: Present_state <= T3;
        T3: Present_state <= T4;
        T4: Present_state <= T5;
        T5: Present_state <= T6;
        T6: Present_state <= T7;
        T7: Present_state <= Default;
      endcase
    end
  end
  
  always @(Present_state) begin
    case(Present_state)
      Default: begin
        // Initialize all output signals to 0
        R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0;
        R5out <= 0; R6out <= 0; R7out <= 0; R8out <= 0; R9out <= 0;
        R10out <= 0; R11out <= 0; R12out <= 0; R13out <= 0; R14out <= 0; R15out <= 0;
        HIout <= 0; LOout <= 0; Zhighout <= 0; Zlowout <= 0;
        PCout <= 0; MDRout <= 0; InPortout <= 0; Zout <= 0; Cout <= 0;
        
        // Initialize all input signals to 0
        R0in <= 0; R1in <= 0; R2in <= 0; R3in <= 0; R4in <= 0;
        R5in <= 0; R6in <= 0; R7in <= 0; R8in <= 0; R9in <= 0;
        R10in <= 0; R11in <= 0; R12in <= 0; R13in <= 0; R14in <= 0; R15in <= 0;
        MARin <= 0; PCin <= 0; MDRin <= 0; IRin <= 0; Yin <= 0; Zin <= 0;
        HIin <= 0; LOin <= 0; ZhighIn <= 0; ZlowIn <= 0;
        
        // Control signals
        Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0; Read <= 0;
        
        // Force initial state if needed
        force DUT.BusMuxOut = 32'h00000000;
      end

      // Load instruction address into MAR
      T0: begin
        PCout <= 1; MARin <= 1;
      end

      // Read instruction into MDR
      T1a: begin
        PCout <= 0; MARin <= 0;
        release DUT.BusMuxOut;
        Read <= 1;
      end

      T1b: begin
        MDRin <= 1;
      end

      // Move instruction from MDR to IR
      T2: begin
        MDRin <= 0; Read <= 0;
        MDRout <= 1; IRin <= 1;
      end

      // Extract memory location (0x54) from IR and store in MAR
      T3: begin
        MDRout <= 0; IRin <= 0;
        Grb <= 1; 
        IRout <= 1;
      end

      T4: begin
        IRout <= 0; Grb <= 0;
        Cout <= 1;
      end

      T5: begin
        Cout <= 0;
        MARin <= 1;
      end
      
      T6: begin
        MARin <= 0;
        Read <= 1;
      end

      T7: begin
        Read <= 0;
        Gra <= 1; Grb <= 1; Grc <= 1; Rin <= 1;
      end
    endcase
  end

endmodule
