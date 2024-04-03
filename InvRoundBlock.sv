//==============================================================================
//  Filename    : RoundBlock                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module InvRoundBlock(
  input  logic[0:127]          message,
  input logic[0:127]           roundKey,
  output logic[0:127]          crypte
);

logic [0:127] afterSubBytes, afterShiftRows, afterRoundKey;

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
  .crypte(afterRoundKey)
);

InvMixColumns InvMixColumns1(
  .message(afterRoundKey),
  .crypte(crypte)
);



endmodule

