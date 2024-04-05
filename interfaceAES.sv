//==============================================================================
//  Filename    : Interface
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module interfaceAES(
  input  logic[0:31]          data_in,
  output logic[0:31]         data_out,
  input logic[0:127]           crypte,
  input logic                 clk,
  input logic                 reset,
  input logic                 RW,
  input logic                 adress,
  input logic                 initiate,
  output logic[0:127]          message,
  output logic[0:127]          key,
  output logic                 CS  
);

logic shift_out, load, shift_in_message, shift_in_key;


ShiftRegister128to32 crypte_register(
  .data_in(crypte),
  .data_out(data_out),
  .shift_out(shift_out),
  .clk(clk),
  .reset(reset),
  .load(load)
) ; 

ShiftRegister32to128 message_register(
  .clk(clk),
  .reset(reset),
  .data_in(data_in),
  .data_out(message),
  .shift_in(shift_in_message)
); 

ShiftRegister32to128 message_key(
  .clk(clk),
  .reset(reset),
  .data_in(data_in),
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




endmodule

