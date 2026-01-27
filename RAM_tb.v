module RAM_tb;
    reg clock, clear;
    reg [31:0] MAR;  // Memory Address Register
    reg Read;        // Read signal
    wire [31:0] Mdatain;  // Data from RAM to MDR

    // Instantiate the RAM
    RAM ram1 (
        .clock(clock),
        .we(0),  // We only need to read, so write enable is 0
        .Read(Read),
        .address(MAR[8:0]),  // Correct address width (9-bit)
        .data_in(32'b0),  // No data to write (we only read)
        .data_out(Mdatain)  // Correct output port name
    );

    initial begin
        // Set up initial conditions
        clock = 0;
        clear = 1;
        MAR = 32'h00000000;  // Memory address 0x00000000
        Read = 0;
        #5 clear = 0;  // Reset after some time
        
        // Trigger the read operation at address 0x00000000 (first line in .hex file)
        #10 MAR = 32'h00000000; Read = 1;  // Enable reading from RAM at 0x00000000
        #10 Read = 0;  // Disable the read signal
        
        // Check the value in Mdatain for the first memory address
        #10;  // Wait for RAM to respond
        $display("Data read from memory location 0x%h: 0x%h", MAR, Mdatain);
        
        // Now check the value at memory location 0x00000054 (line 85 in the .hex file)
        #10 MAR = 32'h00000054; Read = 1;  // Enable reading from RAM at 0x00000054
        #10 Read = 0;  // Disable the read signal
        
        // Check the value in Mdatain for the second memory address
        #10;  // Wait for RAM to respond
        $display("Data read from memory location 0x%h: 0x%h", MAR, Mdatain);
        
        // Finish the simulation
        #10 $finish;
    end
    
    always begin
        #5 clock = ~clock;  // Toggle clock every 5 time units
    end
endmodule
