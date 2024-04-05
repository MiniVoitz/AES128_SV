//==============================================================================
//  Filename    : PuceAES128                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module PuceAES128(
  input logic                  clk,
  input logic                  reset,
  input logic                  selCypher,     // Encryption Or Decryption ?
  input logic                  start,
  input logic                  RW,
  input logic                  adress,
  input logic                  initiate,
  input logic[0:31]            data_in,
  output logic[0:31]           data_out,
  output logic                 CS
);

//====Signal Init================================================================

logic[0:127] afterMessage, afterKey, afterCompute;

//======Interface init==========================================
interfaceAES interfaceAES_1(
  .data_in(data_in),
  .data_out(data_out),
  .crypte(afterCompute),
  .clk(clk),
  .reset(reset),
  .RW(RW),
  .initiate(initiate),
  .adress(adress),
  .message(afterMessage),
  .key(afterKey),
  .CS(CS)
);

//=======AES128 init=======================
AES128 AES128_1(
  .clk(clk),
  .reset(reset),
  .selCypher(selCypher),
  .message_in(afterMessage),
  .key(afterKey),
  .message_out(afterCompute),
  .start(start)
);


endmodule

