//==============================================================================
//  Filename    : Tristate                                               
//  Designer    : TV & HD
//  Description : 32 bit tri-state register
//==============================================================================
module Tristate (
  input   logic  [31:0]  buff_in,     // Clear Accumulation 
  input   logic         CS,     // Clear Accumulation 
  output  logic  [31:0]  buff_out     // Input Data A
);

// == Variables Declaration ====================================================
// empty
logic[31:0] buff;

// == Main Code ================================================================
always_comb begin
    buff = (CS == 0) ? 'z : buff_in;
end

assign buff_out = buff;
endmodule
