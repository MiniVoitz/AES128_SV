library verilog;
use verilog.vl_types.all;
entity mult11to1 is
    port(
        a0              : in     vl_logic_vector(0 to 127);
        a1              : in     vl_logic_vector(0 to 127);
        a2              : in     vl_logic_vector(0 to 127);
        a3              : in     vl_logic_vector(0 to 127);
        a4              : in     vl_logic_vector(0 to 127);
        a5              : in     vl_logic_vector(0 to 127);
        a6              : in     vl_logic_vector(0 to 127);
        a7              : in     vl_logic_vector(0 to 127);
        a8              : in     vl_logic_vector(0 to 127);
        a9              : in     vl_logic_vector(0 to 127);
        a10             : in     vl_logic_vector(0 to 127);
        sel             : in     vl_logic_vector(0 to 3);
        \out\           : out    vl_logic_vector(0 to 127)
    );
end mult11to1;
