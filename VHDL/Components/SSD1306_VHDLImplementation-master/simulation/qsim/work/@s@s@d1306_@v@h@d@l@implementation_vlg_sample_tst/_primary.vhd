library verilog;
use verilog.vl_types.all;
entity SSD1306_VHDLImplementation_vlg_sample_tst is
    port(
        CLKI            : in     vl_logic;
        RSTI            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SSD1306_VHDLImplementation_vlg_sample_tst;
