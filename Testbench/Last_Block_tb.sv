`timescale 1ns / 1ps

module LastBlock_tb;

  // Signal declarations
  logic [127:0] message;
  logic [127:0] roundKey;
  logic [127:0] crypte;

  // Instantiate the LastBlock module
  LastBlock dut (
    .message(message),
    .roundKey(roundKey),
    .crypte(crypte)
  );

  // Test case
  initial begin
    // Assign some random values to message and roundKey
    message = 128'h00112233445566778899AABBCCDDEEFF;
    roundKey = 128'h000102030405060708090A0B0C0D0E0F;

    // Wait for a few clock cycles
    #10;

    // Display the initial values
    $display("Initial Message: %h", message);
    $display("Initial RoundKey: %h", roundKey);

    // Wait for a few more clock cycles
    #10;

    // Display the encrypted result
    $display("Encrypted: %h", crypte);

    // Finish simulation
    $finish;
  end

endmodule
