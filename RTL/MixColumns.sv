//==============================================================================
//  Filename    : MixColums                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module MixColumns(
  input  logic[0:127] message,
  output  logic[0:127] crypte  
);


// == Functions Declaration ====================================================

function [0:7] times2;
    input [0:7] x;
    begin
			if(x[0] == 1) times2 = ((x << 1) ^ 8'h1b); // Galois Corps (Irreductible polynome) => XOR and Modular multiplication
			else times2 = x << 1; 
    end
endfunction

function [0:7] times3; // 3x = (2 + 1)x = 2x + x
	input [0:7] x;
	begin 
		times3 = times2(x) ^ x;
	end 
endfunction

// == Main Code ================================================================


// |02 03 01 01| 
// |01 02 03 01|
// |01 01 02 03|
// |03 01 01 02|

genvar i;

generate
for(i=0; i<4; i++) begin
    assign crypte[i*8+:8] = times2(message[i*8+:8])^times3(message[8*i+32+:8])^message[8*i+64+:8]^message[8*i+96+:8];
    assign crypte[i*8+32+:8] = (message[i*8+:8]) ^ times2(message[8*i+32+:8]) ^ times3(message[8*i+64+:8]) ^ message[8*i+96+:8];
    assign crypte[i*8+64+:8] =(message[i*8+:8])^(message[8*i+32+:8])^times2(message[8*i+64+:8])^times3(message[8*i+96+:8]);
    assign crypte[i*8+96+:8] = times3(message[i*8+:8]) ^ (message[8*i+32+:8]) ^ (message[8*i+64+:8]) ^ times2(message[8*i+96+:8]);

end
endgenerate

endmodule

