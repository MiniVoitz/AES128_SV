module AES128_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [127:0] message_in; // Message input (128 bits)
  logic [127:0] key;     // Key input (128 bits)
  logic [127:0] message_out;  // Encrypted output (128 bits)
  logic selCypher;
  logic start;

  // Instantiation of the module under test
  AES128 dut(
    .clk(clk),
    .reset(reset),
    .message_in(message_in),
    .key(key),
    .selCypher(selCypher),
    .message_out(message_out),
    .start(start)
  );

  // Clock signal generation
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // Reset initialization
  initial begin
    reset = 1;
    #5 reset = 0;
  end

  // Test data generation
  initial begin
    // Message input (in hexadecimal, 128 bits)
    message_in = 128'h328831E0435A3137F6309807A88DA234;
    // Key input (in hexadecimal, 128 bits)
    key = 128'h2B28AB097EAEF7CF15D2154F16A6883C;

    selCypher = 1;

    #620;

    message_in = 128'h3902DC1925DC116A8409850B1DFB9732;

    selCypher = 0;
        #380;

    message_in = 128'h328831E0435A3137F6309807A88DA234;

    key = 128'h2B28AB097EAEF7CF15D2154F16A6883D;

    selCypher = 1;

    #650;
    message_in = 128'h3902DC1925DC116A8409850B1DFB9732;
    key = 128'h2B28AB097EAEF7CF15D2154F16A6883C;
    selCypher = 0;
    #10000
    $finish;
  end

endmodule