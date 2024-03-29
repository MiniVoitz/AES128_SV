`timescale 1ns / 1ps

module mult2to1_tb;

  // Signal declarations
  logic [0:127] a;
  logic [0:127] b;
  logic sel;
  logic [0:127] out;

  // Instantiate the Mult2to1 module
  mult2to1 dut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
  );

  // Test case
  initial begin
    // Assign some random values to 'a' and 'b'
    a = 128'h123456789ABCDEF0123456789ABCDEF;
    b = 128'hFEDCBA9876543210FEDCBA987654321;
    // Set 'sel' to 0
    sel = 0;
    // Wait for a few clock cycles
    #10;
    // Display the output when 'sel' is 0
    $display("When sel = 0, out = %h", out);
    // Set 'sel' to 1
    sel = 1;
    // Wait for a few clock cycles
    #10;
    // Display the output when 'sel' is 1
    $display("When sel = 1, out = %h", out);
    // Finish simulation
    $finish;
  end

endmodule
