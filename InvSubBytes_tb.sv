module InvSubBytes_tb;

  // Déclaration des signaux du testbench
  logic clk;
  logic [0:127] message;
  logic [0:127] crypte;
  
  // Instanciation du module à tester
  InvSubBytes dut (
    .message(message),
    .crypte(crypte)
  );
  
  // Génération d'une horloge pour le testbench
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initialisation des valeurs
  initial begin
    message = 128'h0123456789abcdef0123456789abcdef;
    #100 $finish;
  end  

// Affichage des resultats
  always @(posedge clk) begin
    $display("Message:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", message[i +: 8], message[i + 8 +: 8], message[i + 16 +: 8], message[i + 24 +: 8]);
    
    $display("\nCrypte:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", crypte[i +: 8], crypte[i + 8 +: 8], crypte[i + 16 +: 8], crypte[i + 24 +: 8]);
  end
  endmodule
