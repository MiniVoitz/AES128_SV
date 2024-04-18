//==============================================================================
//  Filename    : LastBlock                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module LastBlock(
  input  logic[0:127]          message,
  input logic[0:127]           roundKey,
  output logic[0:127]          crypte
);

logic [0:127] afterSubBytes, afterShiftRows;

SubBytes SubBytes1(
  .message(message),
  .crypte(afterSubBytes)
);

ShiftRows ShiftRows1(
  .message(afterSubBytes),
  .crypte(afterShiftRows)
);

AddRound_Key AddRoundKey1(
  .message(afterShiftRows),
  .roundKey(roundKey),
  .crypte(crypte)
);


endmodule

