`timescale 1ns / 1ps
module PuceAES128_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic selCypher;
  logic start;
  logic RW;
  logic adress;
  logic initiate;
 
  wire[0:31] data;
  logic[0:31] data_in;
  logic[0:31] data_out;

  assign data = data_in;
  assign data_out = data;

  // Instantiation of the module under test
PuceAES128 dut(
  .clk(clk),
  .reset(reset),
  .selCypher(selCypher),
  .start(start),
  .RW(RW),
  .adress(adress),
  .initiate(initiate),
  .data(data)
);

  // Clock signal generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset initialization
  initial begin
    reset = 1;
    data_in = 'z;
    #5 reset = 0;
  end

  // Test data generation
  initial begin
    #10;

    //Ecriture dans le buffer message
    data_in = 32'h01234567;
    RW = 1;
    adress = 0;
    initiate = 1;
    start = 0;

    #60;

    //Ecriture dans le buffer key
    data_in = 32'habcdefab;

    RW = 1;
    adress = 1;
    initiate = 1;
    selCypher = 1;
    
    #50;
    //Lancement du calcul
    start = 1;
    initiate = 0;
    #10;
    start = 0;

    //Récupération du résultat sur le bus
    #350;
    initiate = 1;
    data_in = 'z;
    RW = 0;

    initiate = 1;

    #60;
    //Envoi du message à décrypter
    data_in = 32'h76543210;
    RW = 1;
    adress = 0;
    initiate = 1;
    start = 0;
    selCypher = 0;

    #50;
    //Lancement du calcul
    initiate = 0;
    start = 1;
    #10;
    start = 0;

    //récupération du résultat sur le bus
    #220;
    initiate = 1;
    data_in = 'z;
    RW=0;

    #100;




  end

endmodule