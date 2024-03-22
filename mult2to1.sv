//==============================================================================
//  Filename    : Mult2to1                                           
//  Designer    : TV & HD
//  Description : 2 to 1 multiplexer
//==============================================================================
module mult2to1 (
    input logic[0:127] a,
    input logic[0:127] b,
    input logic sel,
    output logic[0:127] out
);

// == Main Code ================================================================

    assign out = sel ? b : a;

endmodule
