//==============================================================================
//  Filename    : ShiftRegister32to128                                               
//  Designer    : TV & HD
//  Description : 
//==============================================================================
module ShiftRegister32to128 (
  input   logic         clk,         // Main Clock
  input   logic         reset,       // Synchronous Active High Reset (More Robust mapping on FPGA)
  input   logic  [31:0]  data_in,     // Clear Accumulation 
  input   logic         shift_in,     // Clear Accumulation 
  output  logic  [127:0]  data_out     // Input Data A
);

// == Variables Declaration ====================================================
// empty

// == Main Code ================================================================
logic [127:0] shift_reg;

// Shift-in MSB first
always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 128'b0;
    end else begin
        shift_reg <= {shift_reg[95:0], data_in};
    end
end

// Sortie du registre à décalage
assign data_out = shift_reg;



endmodule