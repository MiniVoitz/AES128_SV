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
  inout wire[0:31]            data
);

//====Signal Init================================================================

logic[0:127] afterMessage, afterKey, afterCompute;

//======Interface init==========================================
interfaceAES interfaceAES_1(
  .data(data),
  .crypte(afterCompute),
  .clk(clk),
  .reset(reset),
  .RW(RW),
  .initiate(initiate),
  .adress(adress),
  .message(afterMessage),
  .key(afterKey)
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

