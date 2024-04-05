library verilog;
use verilog.vl_types.all;
entity \buffer\ is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        buff_in         : in     vl_logic_vector(127 downto 0);
        buff_en         : in     vl_logic;
        buff_out        : out    vl_logic_vector(127 downto 0)
    );
end \buffer\;
