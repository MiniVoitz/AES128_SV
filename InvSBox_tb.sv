module InvSBox_tb;

  // Signal declarations for the testbench
  logic [0:7] message;
  logic [0:7] crypte;
  
  // Instantiation of the module under test
  InvSBox dut (
    .message(message),
    .crypte(crypte)
  );
  
  // Initialization of values
  initial begin
    // Testing different possible values for the message
    for (int i = 0; i < 256; i++) begin
      // Assign the current value of 'i' to the message
      message = i;
      // Wait for some time
      #10;
      // Display the current message and the corresponding encrypted value
      $display("Message = %h, Encrypted = %h", message, crypte);
    end
    // Finish simulation
    $finish;
  end
  
endmodule
