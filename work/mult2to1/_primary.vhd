library verilog;
use verilog.vl_types.all;
entity mult2to1 is
    port(
        a               : in     vl_logic_vector(0 to 127);
        b               : in     vl_logic_vector(0 to 127);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(0 to 127)
    );
end mult2to1;
