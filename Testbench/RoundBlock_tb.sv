module RoundBlock_tb;
  
  // Declaration des signaux du testbench
  logic clk;
  logic [0:127] message;
  logic [0:127] roundKey;
  logic [0:127] crypte;
  
  // Instanciation du module a tester
  RoundBlock rb(
    .message(message),
    .roundKey(roundKey),
    .crypte(crypte)
  );
  
  // Generation clk
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initialisation des valeurs
  initial begin
    message = 128'h19a09ae93df4c6f8e3e28d48be2b2a08;
    roundKey = 128'ha088232afa54a36cfe2c397617b13905;
    #100 $finish;
  end

  // Affichage des resultats
  always @(posedge clk) begin
    $display("\nMessage:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", message[i +: 8], message[i + 8 +: 8], message[i + 16 +: 8], message[i + 24 +: 8]);
      
    $display("\nCryptE:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", crypte[i +: 8], crypte[i + 8 +: 8], crypte[i + 16 +: 8], crypte[i + 24 +: 8]);
  end
  
endmodule
