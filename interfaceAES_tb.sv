`timescale 1ns / 1ps
module interfaceAES_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic[0:127] crypte;
  logic CS;
  logic RW;
  logic adress;
  logic[0:127] message;
  logic[0:127] key;
  logic initiate;
 
  wire[0:31] data;
  logic[0:31] data_in;
  logic[0:31] data_out;

  assign data = data_in;
  assign data_out = data;

  // Instantiation of the module under test
  interfaceAES dut(
    .clk(clk),
    .reset(reset),
    .RW(RW),
    .adress(adress),
    .message(message),
    .key(key),
    .data(data),
    .crypte(crypte),
    .initiate(initiate)
  );

  // Clock signal generation
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
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
    data_in = 32'h01234567;
    RW = 1;
    adress = 0;
    initiate = 1;

    #90;

    data_in = 32'habcdefab;

    RW = 1;
    adress = 1;
    initiate = 1;

    #100;
    data_in = 'z;
    RW = 0;

    initiate = 1;
    crypte = 128'h123456789ABCDEF0123456789ABCDEF;


    #100;
  end

endmodule