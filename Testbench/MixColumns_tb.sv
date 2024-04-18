module MixColumns_tb;

  // Signal declarations for the testbench
  logic clk;
  logic [0:127] message;
  logic [0:127] crypte;
  
  // Instantiation of the module under test
  MixColumns dut (
    .message(message),
    .crypte(crypte)
  );
  
  // Clock generation for the testbench
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initialization of values
  initial begin
    // Set the message to a predefined value
    message = 128'hD4E0B81EBFB441275D52119830AEF1E5;
    // Finish simulation after some time
    #100 $finish;
  end

  // Displaying results
  always @(posedge clk) begin
    $display("Message:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", message[i +: 8], message[i + 8 +: 8], message[i + 16 +: 8], message[i + 24 +: 8]);
    
    $display("\nEncrypted:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", crypte[i +: 8], crypte[i + 8 +: 8], crypte[i + 16 +: 8], crypte[i + 24 +: 8]);
  end
  
endmodule
