library verilog;
use verilog.vl_types.all;
entity IF2ID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IF2IDRst        : in     vl_logic;
        IRWr            : in     vl_logic
    );
end IF2ID;
