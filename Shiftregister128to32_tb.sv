`timescale 1ns / 1ps

module ShiftRegister128to32_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [127:0] data_in;
  logic shift_out;
  logic load;
  logic [31:0] data_out;

  // Instantiate the Buffer module
  ShiftRegister128to32 dut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .shift_out(shift_out),
    .load(load),
    .data_out(data_out)
  );

  // Clock generation
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
    // Enable buffer and provide input data
    #15 load = 1;
    data_in = 128'h123456789ABCDEF0123456789ABCDEF;
    #5;
    load = 0;
    shift_out = 1;
  end

endmodule
