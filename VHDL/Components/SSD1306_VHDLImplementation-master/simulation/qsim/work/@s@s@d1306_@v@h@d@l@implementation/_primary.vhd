library verilog;
use verilog.vl_types.all;
entity SSD1306_VHDLImplementation is
    port(
        CD              : out    vl_logic;
        CLKI            : in     vl_logic;
        RSTI            : in     vl_logic;
        CLKO            : out    vl_logic;
        DO              : out    vl_logic;
        CS              : out    vl_logic;
        RSTO            : out    vl_logic
    );
end SSD1306_VHDLImplementation;
