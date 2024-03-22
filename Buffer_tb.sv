`timescale 1ns / 1ps

module buffer_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [127:0] buff_in;
  logic buff_en;
  logic [127:0] buff_out;

  // Instantiate the Buffer module
  buffer dut (
    .clk(clk),
    .reset(reset),
    .buff_in(buff_in),
    .buff_en(buff_en),
    .buff_out(buff_out)
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
    #15 buff_en = 1;
    buff_in = 128'h123456789ABCDEF0123456789ABCDEF;
    // Wait for a clock cycle
    #5;
    // Disable buffer
    buff_en = 0;
    // Wait for a few clock cycles
    #10;
    // Enable buffer again and change input data
    buff_en = 1;
    buff_in = 128'hFEDCBA9876543210FEDCBA987654321;
    // Wait for a clock cycle
    #5;
    // Disable buffer
    buff_en = 0;
    // Wait for a few clock cycles
    #10;
    // Enable buffer again and change input data
    buff_en = 1;
    buff_in = 128'h00000000000000000000000000000000;
    // Wait for a clock cycle
    #5;
    // Disable buffer
    buff_en = 0;
    // Finish simulation after a few more clock cycles
    #10;
    $finish;
  end

endmodule
