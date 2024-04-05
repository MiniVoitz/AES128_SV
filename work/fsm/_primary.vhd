library verilog;
use verilog.vl_types.all;
entity fsm is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        selCypher       : in     vl_logic;
        keyChange       : in     vl_logic;
        keyInit         : out    vl_logic_vector(0 to 3);
        sel1            : out    vl_logic;
        sel2            : out    vl_logic;
        sel3            : out    vl_logic;
        sel4            : out    vl_logic_vector(0 to 3);
        sel5            : out    vl_logic;
        buffer1en       : out    vl_logic;
        buffer2en       : out    vl_logic;
        buffer3en       : out    vl_logic;
        buffer4en       : out    vl_logic;
        buffer5en       : out    vl_logic;
        buffer7en       : out    vl_logic;
        buffer8en       : out    vl_logic;
        B0en            : out    vl_logic;
        B1en            : out    vl_logic;
        B2en            : out    vl_logic;
        B3en            : out    vl_logic;
        B4en            : out    vl_logic;
        B5en            : out    vl_logic;
        B6en            : out    vl_logic;
        B7en            : out    vl_logic;
        B8en            : out    vl_logic;
        B9en            : out    vl_logic;
        B10en           : out    vl_logic
    );
end fsm;
