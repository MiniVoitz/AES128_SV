//==============================================================================
//  Filename    : AES128                                            
//  Designer    : TV & HD
//  Description : 
//==============================================================================

module AES128(
  input logic                  clk,
  input logic                  reset,
  input logic                  selCypher,     // Encryption Or Decryption ?
  input  logic[0:127]          message_in,
  input logic[0:127]           key,
  output logic[0:127]          message_out
);

//====Signal Init================================================================


logic [0:127] afterBuff1,
              afterBuff2,
              afterBuff3,
              afterBuff4,
              afterBuff5,
              afterBuff7,
              afterBuff8,
              afterBuff9,
              afterB0,
              afterB1,
              afterB2,
              afterB3,
              afterB4,
              afterB5,
              afterB6,
              afterB7,
              afterB8,
              afterB9,
              afterB10,
              roundKey,
              afteraddroundkey_encrypt, //After the first AddRounKey in each block
              afteraddroundkey_decrypt,
              afterMult_encrypt,
              afterMult_decrypt,
              afterKeyExp,
              afterMult_keyexp,
              afterMult_buff,
              afterRoundBlock_encrypt,
              afterlastblock_encrypt,
              afterRoundBlock_decrypt,
              afterlastblock_decrypt,
              keyChange128; 

logic [0:3] keyInit, 
            sel4;

logic buffer1en,
      buffer2en,
      buffer3en,
      buffer4en, 
      buffer5en, 
      buffer7en,
      buffer8en,
      buffer9en,
      B0en, 
      B1en,
      B2en,
      B3en,
      B4en, 
      B5en, 
      B6en,
      B7en,
      B8en,
      B9en,
      B10en,
      sel1, 
      sel2,
      sel3,
      sel5;

assign keyChange128 = afterB0^afterBuff2;
assign keyChange = (&(keyChange128 == 0));
//====Fsm Init================================================================

fsm fsm1(
  .clk(clk),
  .reset(reset),
  .keyInit(keyInit),
  .keyChange(keyChange),
  .selCypher(selCypher),
  .sel1(sel1),
  .sel2(sel2),
  .sel3(sel3),
  .sel4(sel4),
  .sel5(sel5),
  .buffer1en(buffer1en),
  .buffer2en(buffer2en),
  .buffer3en(buffer3en),
  .buffer4en(buffer4en),
  .buffer5en(buffer5en),
  .buffer7en(buffer7en),
  .buffer8en(buffer8en),
  .buffer9en(buffer9en),
  .B0en(B0en),
  .B1en(B1en),
  .B2en(B2en),
  .B3en(B3en),
  .B4en(B4en),
  .B5en(B5en),
  .B6en(B6en),
  .B7en(B7en),
  .B8en(B8en),
  .B9en(B9en),
  .B10en(B10en)
);

//====Encryption Init================================================================

AddRound_Key addroundkey_encrypt(
  .message(afterBuff1),
  .roundKey(afterMult_buff),  
  .crypte(afteraddroundkey_encrypt)
);

mult2to1 mult_encrypt(
  .a(afteraddroundkey_encrypt),
  .b(afterBuff4),
  .sel(sel1),
  .out(afterMult_encrypt)
);

RoundBlock roundblock_encrypt(
  .message(afterBuff3),
  .roundKey(afterMult_buff),  
  .crypte(afterRoundBlock_encrypt)
);

LastBlock lastblock_encrypt(
  .message(afterBuff4),
  .roundKey(afterMult_buff),  
  .crypte(afterlastblock_encrypt)
);

//====Decryption Init================================================================

AddRound_Key addroundkey_decrypt(
  .message(afterBuff2),
  .roundKey(afterMult_buff),  
  .crypte(afteraddroundkey_decrypt)
);

mult2to1 mult_decrypt(
  .a(afteraddroundkey_decrypt),
  .b(afterBuff8),
  .sel(sel2),
  .out(afterMult_decrypt));

RoundBlock roundblock_decrypt(
  .message(afterBuff7),
  .roundKey(afterMult_buff),  
  .crypte(afterRoundBlock_decrypt)
);

LastBlock lastblock_decrypt(
  .message(afterBuff8),
  .roundKey(afterMult_buff),  
  .crypte(afterlastblock_decrypt)
);

mult2to1 mult_output(
  .a(afterBuff5),
  .b(afterBuff9),
  .sel(sel5),
  .out(message_out));


//====KeyExp Init================================================================


KeyExpansion keyexpansion1(
  .keyInit(keyInit),
  .key(afterMult_buff),
  .roundKey(afterKeyExp)
);


//====Buffer Init================================================================


buffer buffer1(
  .clk(clk),
  .reset(reset),
  .buff_in(message_in),
  .buff_en(buffer1en),
  .buff_out(afterBuff1)
);

buffer buffer2(
  .clk(clk),
  .reset(reset),
  .buff_in(key),
  .buff_en(buffer2en),
  .buff_out(afterBuff2)
);

buffer buffer3(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_encrypt),
  .buff_en(buffer3en),
  .buff_out(afterBuff3)
);

buffer buffer4(
  .clk(clk),
  .reset(reset),
  .buff_in(afterRoundBlock_encrypt),
  .buff_en(buffer4en),
  .buff_out(afterBuff4)
);

buffer buffer5(
  .clk(clk),
  .reset(reset),
  .buff_in(afterlastblock_encrypt),
  .buff_en(buffer5en),
  .buff_out(afterBuff5)
);


buffer buffer7(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_decrypt),
  .buff_en(buffer7en),
  .buff_out(afterBuff7)
);

buffer buffer8(
  .clk(clk),
  .reset(reset),
  .buff_in(afterRoundBlock_decrypt),
  .buff_en(buffer8en),
  .buff_out(afterBuff8)
);

buffer buffer9(
  .clk(clk),
  .reset(reset),
  .buff_in(afterlastblock_decrypt),
  .buff_en(buffer9en),
  .buff_out(afterBuff9)
);

buffer B0(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B0en),
  .buff_out(afterB0)
);

buffer B1(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B1en),
  .buff_out(afterB1)
);

buffer B2(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B2en),
  .buff_out(afterB2)
);

buffer B3(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B3en),
  .buff_out(afterB3)
);

buffer B4(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B4en),
  .buff_out(afterB4)
);

buffer B5(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B5en),
  .buff_out(afterB5)
);

buffer B6(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B6en),
  .buff_out(afterB6)
);

buffer B7(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B7en),
  .buff_out(afterB7)
);

buffer B8(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B8en),
  .buff_out(afterB8)
);

buffer B9(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B9en),
  .buff_out(afterB9)
);

buffer B10(
  .clk(clk),
  .reset(reset),
  .buff_in(afterMult_keyexp),
  .buff_en(B10en),
  .buff_out(afterB10)
);


endmodule

