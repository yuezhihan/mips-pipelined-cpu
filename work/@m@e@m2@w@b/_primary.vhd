library verilog;
use verilog.vl_types.all;
entity MEM2WB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IRWr            : in     vl_logic
    );
end MEM2WB;
