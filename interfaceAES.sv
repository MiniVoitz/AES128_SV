//==============================================================================
//  Filename    : Interface
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module interfaceAES(
  inout  logic[0:32]          data,
  input logic[0:127]           crypte,
  input logic                 CS,
  input logic                 clk,
  input logic                 reset,
  input logic                 RW,
  input logic                 adress,
  output logic[0:127]          message,
  output logic[0:127]          key  
);

logic [0:127] shift_out, load, shift_in_message, shift_in_message;

ShiftRegister128to32 crypte_register(
  .data_in(crypte),
  .data_out(data),
  .shift_out(shift_out),
  .clk(clk),
  .reset(reset),
  .CS(CS),
  .load(load)
) ; 

ShiftRegister32to128 message_register(
  .clk(clk),
  .reset(reset),
  .data_in(data),
  .data_out(message),
  .shift_in(shift_in_message)
); 

ShiftRegister32to128 message_key(
  .clk(clk),
  .reset(reset),
  .data_in(data),
  .data_out(key),
  .shift_in(shift_in_key)
); 




endmodule

