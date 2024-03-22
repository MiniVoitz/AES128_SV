package Rcon_pkg;

localparam [0:9][0:31]Rcon ={
    32'h01000000,
    32'h01000000, //KeyInit = 0 => on fait fois 1 ?
    32'h02000000,
    32'h04000000,
    32'h08000000,
    32'h10000000,
    32'h20000000,
    32'h40000000,
    32'h80000000,
    32'h1b000000,
    32'h36000000
};


endpackage



module KeyExpansion(
  input  logic          clk,
  input logic[3:0] keyInit, // Round Number between 0 & 10
  input logic[0:127] key, //Should be key or the last roundkey created
  output logic[0:127] roundKey
);

import Rcon_pkg ::*;
import SBox_pkg::*;

//To rotate the last col => 1st line move to 4th
function [0:31] rotWord; 
    input [0:31] w;
    begin
    rotWord[24:31] = w[0:7];
    rotWord[0:7] = w[8:15];
    rotWord[8:15] = w[16:23];
    rotWord[16:23] = w[24:31];
    end
endfunction

//Using S_Box to substitute the last col
function [0:31] substitution;
    input [0:31] x;
    begin
         substitution[0+:8] = S_Box[x[0+:8]]; 
         substitution[8+:8] = S_Box[x[8+:8]]; 
         substitution[16+:8] = S_Box[x[16+:8]]; 
         substitution[24+:8] = S_Box[x[24+:8]]; 
    end
endfunction

//Buffer variables
logic [0:31] col1,col2,col3,col4,col1_r,col2_r,col3_r,col4_r,col4_rot,col4_sub;

assign col1 = {key[0+:8],key[32+:8],key[64+:8],key[96+:8]};
assign col2 = {key[8+:8],key[32+8+:8],key[64+8+:8],key[96+8+:8]};
assign col3 = {key[16+:8],key[32+16+:8],key[64+16+:8],key[96+16+:8]};
assign col4 = {key[24+:8],key[32+24+:8],key[64+24+:8],key[96+24+:8]};  //key
assign col4_rot = rotWord(col4);
assign col4_sub = substitution(col4_rot);
assign col1_r = col1^col4_sub^Rcon[keyInit];
assign col2_r = col1_r^col2;
assign col3_r = col2_r^col3;
assign col4_r = col3_r^col4;
assign {roundKey[0+:8],roundKey[32+:8],roundKey[64+:8],roundKey[96+:8]} = col1_r;
assign {roundKey[8+:8],roundKey[32+8+:8],roundKey[64+8+:8],roundKey[96+8+:8]} = col2_r;
assign {roundKey[16+:8],roundKey[32+16+:8],roundKey[64+16+:8],roundKey[96+16+:8]} = col3_r;
assign {roundKey[24+:8],roundKey[32+24+:8],roundKey[64+24+:8],roundKey[96+24+:8]} = col4_r;



endmodule


