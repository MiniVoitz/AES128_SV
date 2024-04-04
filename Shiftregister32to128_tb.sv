`timescale 1ns / 1ps

module ShiftRegister32to128_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [31:0] data_in;
  logic shift_in;
  logic [127:0] data_out;

  // Instantiate the Buffer module
  ShiftRegister32to128 dut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .shift_in(shift_in),
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
    #15 shift_in = 1;
    data_in = 32'h01234567;
  end

endmodule
