//==============================================================================
//  Filename    : SubBytes                                            
//  Designer    : TV & HD
//  Description : Contient S-BOX et fait la substitution
//==============================================================================

module InvSubBytes (
  input logic[0:127]    message,
  output logic[0:127]    crypte
);


// == Variables Declaration ====================================================

genvar i;

// == Main Code ================================================================

generate
  for (i = 0; i <= 120; i = i + 8) begin
        InvSBox InvS_Box1(.message(message[i+:8]),.crypte(crypte[i+:8]));
  end
endgenerate

    
endmodule

