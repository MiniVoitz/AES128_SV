//==============================================================================
//  Filename    : ShiftRows                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module ShiftRows (
  input logic[0:127]    message,
  output logic[0:127]    crypte
);


// == Main Code ================================================================

logic [31:0] row1, row2, row3, row4;

assign row1 = {message[0:0+7],message[0+8:0+15],message[0+16:0+23],message[0+24:0+31]};
assign row2 = {message[32+8:32+15],message[32+16:32+23],message[32+24:32+31],message[32:32+7]}; //1 shift left
assign row3 = {message[64+16:64+23],message[64+24:64+31],message[64:64+7],message[64+8:64+15]}; //2 shift left
assign row4 = {message[96+24:96+31],message[96:96+7],message[96+8:96+15],message[96+16:96+23]}; //3 shift left

assign crypte = {row1,row2,row3,row4};

endmodule


