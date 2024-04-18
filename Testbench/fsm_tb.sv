`timescale 1ns / 1ps

module fsm_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [3:0] keyInitoui;
  logic selCypher;
  logic keyChange;
  logic sel1;
  logic sel2;
  logic sel3;
  logic sel4;
  logic buffer1en;
  logic buffer2en;
  logic buffer3en;
  logic buffer4en;
  logic buffer5en;
  logic buffer7en;
  logic buffer8en;
  logic buffer9en;
  logic start;
  logic B0en, B1en, B2en, B3en, B4en, B5en, B6en, B7en, B8en, B9en, B10en;
  // Instantiate the FSM module
  fsm dut (
    .clk(clk),
    .reset(reset),
    .keyInit(keyInitoui),
    .start(start),
    .sel1(sel1),
    .sel2(sel2),
    .sel3(sel3),
    .sel4(sel4),
    .keyChange(keyChange),
    .selCypher(selCypher),
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
    // Finish simulation after a few more clock cycles
    #1000;
    $finish;
  end

  initial begin
        repeat(10)
    begin
    @(posedge clk);
    end
  
  end
endmodule
