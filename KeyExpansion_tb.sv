import Rcon_pkg ::*;

module KeyExpansion_tb;

  // D�claration des signaux du testbench
  logic clk;
  logic [0:3] keyInit;
  logic [0:127] key;
  logic [0:127] roundKey;
  
  // Instanciation du module � tester
  KeyExpansion dut (
    .clk(clk),
    .keyInit(keyInit),
    .key(key),
    .roundKey(roundKey)
  );
  
  // G�n�ration d'une horloge pour le testbench
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initialisation des valeurs
  initial begin
    keyInit = 0;
    key = 128'h2B28AB097EAEF7CF15D2154F16A6883C;
    // Boucle pour faire varier KeyInit de 0 to 10
    #20;
    keyInit = 1;
    #20;
    keyInit = 2;
    key = 128'ha088232afa54a36cfe2c397617b13905;
    #20;
    keyInit = 3;
    key = 128'hf27a5973c296355995b980f6f2437a7f;
    #20;
    keyInit = 4;
    key = 128'h3d471e6d8016237a47fe7e887d3e443b;
    #20;
    keyInit = 5;
    key = 128'hefa8b6db4452710ba55b25ad417f3b00;
    #20;
    keyInit = 6;
    key = 128'hd47cca11d183f2f9c69db815f887bcbc;
    #20;
    keyInit = 7;
    key = 128'h6d11dbca880bf900a33e86937afd41fd;
    #20;
    keyInit = 8;
    key = 128'h4e5f844e545fa6a6f7c94fdc0ef3b24f;
    #20;
    keyInit = 9;
    key = 128'heab5317fd28d2b8d73baf52921d2602f;
    #20;
    keyInit = 10;
    key = 128'hac19285777fad15c66dc2900f321416e;
    #100 $finish;
  end

// Affichage des r�sultats
initial forever
begin
repeat(2)@(posedge clk); 
  $display("\nkeyInit = %4b \n", keyInit);
  $display("\n Rcon = %32h \n", Rcon[keyInit-1]);
    $display("roundKey:");
    for (int i = 0; i < 128; i += 32)
      $write("%02h %02h %02h %02h\n", roundKey[i +: 8], roundKey[i + 8 +: 8], roundKey[i + 16 +: 8], roundKey[i + 24 +: 8]);
end

  
endmodule
