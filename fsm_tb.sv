`timescale 1ns / 1ps

module fsm_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [3:0] keyInitoui;
  logic sel;
  logic sel2;
  logic buffer1en;
  logic buffer2en;
  logic buffer3en;
  logic buffer4en;
  logic buffer5en;
  logic buffer6en;
  // Instantiate the FSM module
  fsm dut (
    .clk(clk),
    .reset(reset),
    .keyInit(keyInitoui),
    .sel(sel),
    .sel2(sel2),
    .buffer1en(buffer1en),
    .buffer2en(buffer2en),
    .buffer3en(buffer3en),
    .buffer4en(buffer4en),
    .buffer5en(buffer5en),
    .buffer6en(buffer6en)
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
    // Display the initial values
    $display("Initial values:");
    $display("keyInit: %4b", keyInitoui);
    $display("sel: %b", sel);
    $display("sel2: %b", sel2);
    $display("buffer1en: %b", buffer1en);
    $display("buffer2en: %b", buffer2en);
    $display("buffer3en: %b", buffer3en);
    $display("buffer4en: %b", buffer4en);
    $display("buffer5en: %b", buffer5en);
    $display("buffer6en: %b", buffer6en);
    // Finish simulation after a few more clock cycles
    #1000;
    $finish;
  end

  initial begin
        repeat(10)
    begin
    @(posedge clk);
    $display("Initial values:");
    $display("keyInit: %4b", keyInitoui);
    $display("sel: %b", sel);
    $display("sel2: %b", sel2);
    $display("buffer1en: %b", buffer1en);
    $display("buffer2en: %b", buffer2en);
    $display("buffer3en: %b", buffer3en);
    $display("buffer4en: %b", buffer4en);
    $display("buffer5en: %b", buffer5en);
    $display("buffer6en: %b", buffer6en); 
    end
  
  end
endmodule
