module AddRound_Key_tb;

  //Declaration des signaux du testbench
  logic clk;
  logic [127:0] message;
  logic [127:0] roundKey;
  logic [127:0] crypte;
  
  // Instanciation du module a tester
  AddRound_Key dut (
    .message(message),
    .roundKey(roundKey),
    .crypte(crypte)
  );
  
  // Generation d'une horloge pour le testbench
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initialisation des valeurs
  initial begin
    message = 128'h0123456789abcdef0123456789abcdef;
    roundKey = 128'hfedcba9876543210fedcba9876543210;
    // Attendre quelques cycles pour voir le r�sultat
    #100 $finish;
  end

  // Affichage des resultats
  always @(posedge clk) begin
    $display("\nMessage:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", message[i +: 8], message[i + 8 +: 8], message[i + 16 +: 8], message[i + 24 +: 8]);
    
    $display("\nroundKey:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", roundKey[i +: 8], roundKey[i + 8 +: 8], roundKey[i + 16 +: 8], roundKey[i + 24 +: 8]);
      
    $display("\nCrypt�:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", crypte[i +: 8], crypte[i + 8 +: 8], crypte[i + 16 +: 8], crypte[i + 24 +: 8]);
  end
  
endmodule
