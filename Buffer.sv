//==============================================================================
//  Filename    : Buffer (aka Registers)                                              
//  Designer    : TV & HD
//  Description : Buffer definition with fixed byte size 
//==============================================================================
module buffer (
  input   logic         clk,         // Main Clock
  input   logic         reset,       // Synchronous Active High Reset (More Robust mapping on FPGA)
  input   logic  [127:0]  buff_in,     // Clear Accumulation 
  input   logic         buff_en,     // Clear Accumulation 
  output  logic  [127:0]  buff_out     // Input Data A
);

// == Variables Declaration ====================================================
// empty

// == Main Code ================================================================
always_ff @(posedge clk,posedge reset)
  if      (reset)         buff_out <= 127'h00;
  else if (buff_en)       buff_out <= buff_in;


endmodule
