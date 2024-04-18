`timescale 1ns / 1ps

module fsmInterface_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic CS;
  logic RW;
  logic adress;
  logic load;
  logic shift_in_message;
  logic shift_in_key;
  logic shift_out;


  // Instantiate the FSM module
  fsmInterface dut (
    .clk(clk),
    .reset(reset),
    .CS(CS),
    .RW(RW),
    .adress(adress),
    .load(load),
    .shift_in_message(shift_in_message),
    .shift_in_key(shift_in_key),
    .shift_out(shift_out)

  );

  // Clock generation for the testbench
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset initialization
  initial begin
    reset = 1;
    #10 reset = 0;
  end

  // Test case
  initial begin
    // Initialize keyInit to all 0s
    // Wait for a few clock cycles
    #10;
    CS = 0;
    #10;
    CS = 1;
    RW = 1;
    adress = 0;
    #50;
    CS = 1;
    RW = 1;
    adress = 1;
    #50;
    CS = 1;
    RW = 0;
    #70;


  end


endmodule
