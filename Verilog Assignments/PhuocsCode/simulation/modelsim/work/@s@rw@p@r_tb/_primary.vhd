library verilog;
use verilog.vl_types.all;
entity SRwPR_tb is
    generic(
        n               : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end SRwPR_tb;
