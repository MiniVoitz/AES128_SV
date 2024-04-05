//==============================================================================
//  Filename    : Interface
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module interfaceAES(
  inout  logic[0:31]          data,
  input logic[0:127]           crypte,
  input logic                 clk,
  input logic                 reset,
  input logic                 RW,
  input logic                 adress,
  input logic                 initiate,
  output logic[0:127]          message,
  output logic[0:127]          key  
);

logic shift_out, load, shift_in_message, shift_in_key, CS;
logic[0:31] after128to32;


ShiftRegister128to32 crypte_register(
  .data_in(crypte),
  .data_out(after128to32),
  .shift_out(shift_out),
  .clk(clk),
  .reset(reset),
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

fsmInterface fsmInterface_1(
  .clk(clk),
  .reset(reset),
  .CS(CS),
  .RW(RW),
  .adress(adress),
  .load(load),
  .shift_in_message(shift_in_message),
  .shift_in_key(shift_in_key),
  .shift_out(shift_out),
  .initiate(initiate)
);

Tristate Tristate_1(
  .buff_in(after128to32),
  .CS(CS),
  .buff_out(data)
);



endmodule

