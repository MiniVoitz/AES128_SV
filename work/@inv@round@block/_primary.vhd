library verilog;
use verilog.vl_types.all;
entity InvRoundBlock is
    port(
        message         : in     vl_logic_vector(0 to 127);
        roundKey        : in     vl_logic_vector(0 to 127);
        crypte          : out    vl_logic_vector(0 to 127)
    );
end InvRoundBlock;
