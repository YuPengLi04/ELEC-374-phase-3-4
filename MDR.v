module MDR #(
    parameter DATA_WIDTH = 32
)(
    input wire clock, clear, MDRin, Read,
    input wire [DATA_WIDTH-1:0] BusMuxOut, Mdatain,
    output reg [DATA_WIDTH-1:0] BusMuxInMDR
);

    always @(posedge clock or posedge clear) begin
        if (clear)
            BusMuxInMDR <= 0;  // Reset MDR when clear is high
        else if (MDRin) begin
            if (Read)
                BusMuxInMDR <= Mdatain;  // Load data from memory when Read is high
            else
                BusMuxInMDR <= BusMuxOut;  // Otherwise, store value from BusMux
        end
    end

endmodule
