library verilog;
use verilog.vl_types.all;
entity EX2MEM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        EX2MEMRst       : in     vl_logic;
        IRWr            : in     vl_logic
    );
end EX2MEM;
