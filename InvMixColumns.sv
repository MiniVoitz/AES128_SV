//==============================================================================
//  Filename    : InvMixColums                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module InvMixColumns(
  input  logic[0:127] message,
  output  logic[0:127] crypte  
);


// == Functions Declaration ====================================================

function[0:7] times2n;
input [0:7] x;
input integer n;
integer i;
begin
	for(i=0;i<n;i=i+1)begin
		if(x[0] == 1) x = ((x << 1) ^ 8'h1b);
		else x = x << 1; 
	end
	times2n=x;
end

//La multiplication par 2 dans l'espace de Galois revient à faire un shift à gauche et XOR avec 1b si on a le bit de poids fort à 1

endfunction

function [0:7] times0e; // 0e*x = x*2^3 + x*2^2 + x*2
	input [0:7] x;
	begin 
		times0e = times2n(x,3) ^ times2n(x,2) ^ times2n(x,1);
	end 
endfunction

function [0:7] times0d; // 0d*x = x*2^3 + x*2^1 + x
	input [0:7] x;
	begin 
		times0d = times2n(x,3) ^ times2n(x,2) ^ x;
	end 
endfunction

function [0:7] times0b; // 0e*x = x*2^3 + x*2^1
	input [0:7] x;
	begin 
		times0b = times2n(x,3) ^ times2n(x,1) ^ x;
	end 
endfunction

function [0:7] times09; // 0e*x = x*2^3 + x
	input [0:7] x;
	begin 
		times09 = times2n(x,3) ^ x;
	end 
endfunction

// == Main Code ================================================================

//On multiplie le vecteur par la matrice suivante :

// |0e 0b 0d 09| 
// |09 0e 0b 0d|
// |0d 09 0e 0b|
// |0b 0d 09 0e|

genvar i;

generate
for(i=0; i<4; i++) begin
    assign crypte[i*8+:8] = times0e(message[i*8+:8])^times0b(message[8*i+32+:8])^times0d(message[8*i+64+:8])^times09(message[8*i+96+:8]);
    assign crypte[i*8+32+:8] = times09(message[i*8+:8]) ^ times0e(message[8*i+32+:8]) ^ times0b(message[8*i+64+:8]) ^ times0d(message[8*i+96+:8]);
    assign crypte[i*8+64+:8] = times0d(message[i*8+:8])^times09(message[8*i+32+:8])^times0e(message[8*i+64+:8])^times0b(message[8*i+96+:8]);
    assign crypte[i*8+96+:8] = times0b(message[i*8+:8]) ^ times0d(message[8*i+32+:8]) ^ times09(message[8*i+64+:8]) ^ times0e(message[8*i+96+:8]);

end
endgenerate

endmodule

