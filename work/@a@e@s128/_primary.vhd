library verilog;
use verilog.vl_types.all;
entity AES128 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        selCypher       : in     vl_logic;
        message_in      : in     vl_logic_vector(0 to 127);
        key             : in     vl_logic_vector(0 to 127);
        message_out     : out    vl_logic_vector(0 to 127)
    );
end AES128;
