//==============================================================================
//  Filename    : AddRound_Key                                          
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module AddRound_Key(     
  input logic[0:127] message,
  input logic[0:127] roundKey, //Envoyé par KeyExpansion
  output logic[0:127] crypte
);

// == Variables Declaration ====================================================

genvar i,j;

// == Main Code ================================================================

// Xor between each coef
generate
for(i=0; i<4; i++)begin
    for(j=0; j<4; j++) begin
        assign crypte[i*32+j*8 +:8] = message[i*32+j*8 +:8] ^ roundKey[i*32+j*8 +:8];
    end
end
endgenerate

endmodule