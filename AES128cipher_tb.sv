module AEScipher128_tb;

  // Signal declarations
  logic clk;
  logic reset;
  logic [127:0] message; // Message input (128 bits)
  logic [127:0] key;     // Key input (128 bits)
  logic [127:0] crypte;  // Encrypted output (128 bits)

  // Instantiation of the module under test
  AEScipher128 dut(
    .clk(clk),
    .reset(reset),
    .message(message),
    .key(key),
    .crypte(crypte)
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
    message = 128'h328831E0435A3137F6309807A88DA234;
    // Key input (in hexadecimal, 128 bits)
    key = 128'h2B28AB097EAEF7CF15D2154F16A6883C;
    // Wait for some time for encryption to complete
    #100;
    // Display the encrypted result
    // Display the initial values
    $display("message:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", message[i +: 8], message[i + 8 +: 8], message[i + 16 +: 8], message[i + 24 +: 8]);

    $display("Key:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", key[i +: 8], key[i + 8 +: 8], key[i + 16 +: 8], key[i + 24 +: 8]);

    #5

    // Display the encrypted result
    $display("cipherText:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", crypte[i +: 8], crypte[i + 8 +: 8], crypte[i + 16 +: 8], crypte[i + 24 +: 8]);

    // Finish simulation
    #10000
    $finish;
  end

endmodule