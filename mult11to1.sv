//==============================================================================
//  Filename    : Mult11to1                                           
//  Designer    : TV & HD
//  Description : 11 to 1 multiplexer
//==============================================================================
module mult11to1 (
    input logic[0:127] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10,
    input logic[0:3] sel,
    output logic[0:127] out
);

// == Main Code ================================================================

always_comb begin
    case (sel)
        4'b0000 : out = a0;
        4'b0001 : out = a1;
        4'b0010 : out = a2;
        4'b0011 : out = a3;
        4'b0100 : out = a4;
        4'b0101 : out = a5;
        4'b0110 : out = a6;
        4'b0111 : out = a7;
        4'b1000 : out = a8;
        4'b1001 : out = a9;
        4'b1010 : out = a10;
        default : out = 128'b0;
    endcase
end

endmodule
