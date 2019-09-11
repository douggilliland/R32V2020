library verilog;
use verilog.vl_types.all;
entity SSD1306_VHDLImplementation_vlg_check_tst is
    port(
        CD              : in     vl_logic;
        CLKO            : in     vl_logic;
        CS              : in     vl_logic;
        DO              : in     vl_logic;
        RSTO            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SSD1306_VHDLImplementation_vlg_check_tst;
