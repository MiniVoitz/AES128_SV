//==============================================================================
//  Filename    : AES128cipher                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module AEScipher128(
  input logic                  clk,
  input logic                  reset,
  input  logic[0:127]          message,
  input logic[0:127]           key,
  output logic[0:127]          crypte
);

logic [0:127] afterBuff1,afterBuff2, afterBuff3, afterBuff4, afterBuff6, roundKey, afteraddroundkey1, afterMult, afterMult2, afterRoundBlock, afterlastblock, afterKeyExpansion; 

logic [0:3] keyInit;

logic buffer1en, buffer2en, buffer3en, buffer4en, buffer5en, buffer6en, sel, sel2;

buffer buffer1(
  .clk(clk),
  .reset(reset),
  .buff_in(message),
  .buff_en(buffer1en),
  .buff_out(afterBuff1)
);

buffer buffer2(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult2),
  .buff_en(buffer2en),
  .buff_out(afterBuff2)
);

AddRound_Key addroundkey1(
  .message(afterBuff1),
  .roundKey(afterBuff2),
  .crypte(afteraddroundkey1)
);

mult2to1 mult(
  .a(afteraddroundkey1),
  .b(afterBuff4),
  .sel(sel),
  .out(afterMult));

mult2to1 mult2(
  .a(key),
  .b(afterBuff6),
  .sel(sel2),
  .out(afterMult2));

fsm fsm1(
  .clk(clk),
  .reset(reset),
  .keyInit(keyInit),
  .sel(sel),
  .sel2(sel2),
  .buffer1en(buffer1en),
  .buffer2en(buffer2en),
  .buffer3en(buffer3en),
  .buffer4en(buffer4en),
  .buffer5en(buffer5en),
  .buffer6en(buffer6en)
);

KeyExpansion keyexpansion1(
  .keyInit(keyInit),
  .key(afterBuff2),
  .roundKey(afterKeyExpansion)
);

buffer buffer3(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult),
  .buff_en(buffer3en),
  .buff_out(afterBuff3)
);

RoundBlock roundblock1(
  .message(afterBuff3),
.roundKey(afterBuff6),
.crypte(afterRoundBlock)
);

buffer buffer4(
  .clk(clk),
  .reset(reset),
  .buff_in(afterRoundBlock),
  .buff_en(buffer4en),
  .buff_out(afterBuff4)
);

LastBlock lastblock1(
  .message(afterBuff4),
  .roundKey(afterBuff6),
  .crypte(afterlastblock)
);

buffer buffer5(
  .clk(clk),
  .reset(reset),
  .buff_in(afterlastblock),
  .buff_en(buffer5en),
  .buff_out(crypte)
);

buffer buffer6(
  .clk(clk),
  .reset(reset),
  .buff_in(afterKeyExpansion),
  .buff_en(buffer6en),
  .buff_out(afterBuff6)
);

endmodule

