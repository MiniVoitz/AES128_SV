//==============================================================================
//  Filename    : ShiftRegister128to32                                               
//  Designer    : TV & HD
//  Description : 
//==============================================================================
module ShiftRegister128to32 (
  input   logic         clk,         // Main Clock
  input   logic         reset,       // Synchronous Active High Reset (More Robust mapping on FPGA)
  input   logic  [127:0]  data_in,     // Clear Accumulation 
  input   logic         shift_out,     // Clear Accumulation 
  input logic           load,
  output  logic  [31:0]  data_out     // Input Data A
);

// == Variables Declaration ====================================================
// empty

// == Main Code ================================================================
logic [127:0] shift_reg;

// Shift-out MSB first
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 128'b0;
    end
    else if (load) begin
        shift_reg <= data_in;
    end 
    else if (shift_out) begin
        shift_reg <= {shift_reg[95:0], 32'h0000};
    end else begin
    end
end

// Sortie du registre à décalage
assign data_out = shift_reg[127:96];



endmodule