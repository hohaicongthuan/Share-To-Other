library verilog;
use verilog.vl_types.all;
entity SRwPR is
    port(
        \In\            : in     vl_logic_vector(7 downto 0);
        sl              : in     vl_logic;
        sr              : in     vl_logic;
        S               : in     vl_logic_vector(1 downto 0);
        Y               : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic
    );
end SRwPR;
