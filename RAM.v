module RAM (
    input wire clock, we, Read,
    input wire [8:0] address,  // Address width (assuming 512 rows)
    input wire [31:0] data_in,  // Data input for write
    output reg [31:0] data_out  // Data output for read
);
    // Memory array (512 words of 32-bits)
    reg [31:0] memory [0:511];

    // Initialize the memory from the .hex file
    initial begin
        $readmemh("Memory2.hex", memory);  // Reads the .hex file into the memory array
    end

    always @(posedge clock) begin
        if (Read) begin
            data_out <= memory[address];  // Read data from memory
        end
        if (we) begin
            memory[address] <= data_in;  // Write data to memory
        end
    end
endmodule
