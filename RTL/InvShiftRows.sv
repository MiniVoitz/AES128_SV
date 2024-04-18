//==============================================================================
//  Filename    : InvShiftRows                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module InvShiftRows (
  input logic[0:127]    message,
  output logic[0:127]    crypte
);


// == Main Code ================================================================

logic [31:0] row1, row2, row3, row4;

assign row1 = {message[0+:8],message[0+8+:8],message[0+16+:8],message[0+24+:8]}; // No shift
assign row2 = {message[32+24+:8],message[32+:8],message[32+8+:8],message[32+16+:8]}; // 1 shift right
assign row3 = {message[64+16+:8],message[64+24+:8],message[64+:8],message[64+8+:8]}; // 2 shift right
assign row4 = {message[96+8+:8],message[96+16+:8],message[96+24+:8],message[96+:8]}; // 3 shift right

assign crypte = {row1,row2,row3,row4};

endmodule


