`timescale 1ns / 1ps

module Tristate_tb;

  // Signal declarations
  logic [31:0] buff_in;
  logic CS;
  logic [31:0] buff_out;
  logic clk;

  // Instantiate the Buffer module
  Tristate dut (
    .buff_in(buff_in),
    .CS(CS),
    .buff_out(buff_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  // Test case
  initial begin
    CS = 1;
    buff_in = 128'h01234567;
    // Wait for a clock cycle
    #10;
    CS = 0;




  end

endmodule
