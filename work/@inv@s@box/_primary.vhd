library verilog;
use verilog.vl_types.all;
entity InvSBox is
    port(
        message         : in     vl_logic_vector(0 to 7);
        crypte          : out    vl_logic_vector(0 to 7)
    );
end InvSBox;
