library verilog;
use verilog.vl_types.all;
entity KeyExpansion is
    port(
        keyInit         : in     vl_logic_vector(3 downto 0);
        key             : in     vl_logic_vector(0 to 127);
        roundKey        : out    vl_logic_vector(0 to 127)
    );
end KeyExpansion;
