//==============================================================================
//  Filename    : RoundBlock                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module RoundBlock(
  input  logic[0:127]          message,
  input logic[0:127]           roundKey,
  output logic[0:127]          crypte
);

logic [0:127] afterSubBytes, afterShiftRows, afterMixColumns;

SubBytes SubBytes1(
  .message(message),
  .crypte(afterSubBytes)
);

ShiftRows ShiftRows1(
  .message(afterSubBytes),
  .crypte(afterShiftRows)
);

MixColumns MixColumns1(
  .message(afterShiftRows),
  .crypte(afterMixColumns)
);

AddRound_Key AddRoundKey1(
  .message(afterMixColumns),
  .roundKey(roundKey),
  .crypte(crypte)
);


endmodule

