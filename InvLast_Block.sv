//==============================================================================
//  Filename    : LastBlock                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module InvLastBlock(
  input  logic[0:127]          message,
  input logic[0:127]           roundKey,
  output logic[0:127]          crypte
);

logic [0:127] afterSubBytes, afterShiftRows;

InvShiftRows InvShiftRows1(
  .message(message),
  .crypte(afterShiftRows)
);


InvSubBytes InvSubBytes1(
  .message(afterShiftRows),
  .crypte(afterSubBytes)
);


AddRound_Key AddRoundKey1(
  .message(afterSubBytes),
  .roundKey(roundKey),
  .crypte(crypte)
);


endmodule

