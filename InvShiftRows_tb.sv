module InvShiftRows_tb;

  // Signal declarations for the testbench
  logic clk;
  logic [0:127] message;
  logic [0:127] crypte;
  
  // Instantiation of the module under test
  InvShiftRows dut (
    .message(message),
    .crypte(crypte)
  );
  
  // Clock generation for the testbench
  initial begin
    clk = 0;
    // Generate a clock signal with a period of 10 time units
    forever #5 clk = ~clk;
  end

  // Initialization of values
  initial begin
    // Initialize the message with a predefined value
    message = 128'h0123456789abcdef0123456789abcdef;
    // Finish simulation after 100 time units
    #100 $finish;
  end

  // Displaying results
  always @(posedge clk) begin
    // Display the message
    $display("Message:");
    for (int i = 0; i < 128; i += 32)
      // Display the message in 32-bit blocks
      $write("%02h %02h %02h %02h\n", message[i +: 8], message[i + 8 +: 8], message[i + 16 +: 8], message[i + 24 +: 8]);
    
    // Display the encrypted message
    $display("\nEncrypted:");
    for (int i = 0; i < 128; i += 32)
      // Display the encrypted message in 32-bit blocks
      $write("%02h %02h %02h %02h\n", crypte[i +: 8], crypte[i + 8 +: 8], crypte[i + 16 +: 8], crypte[i + 24 +: 8]);
  end
  
endmodule
