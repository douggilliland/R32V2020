transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Top_Level_Builds/R32V2020_Build_V001/db {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Top_Level_Builds/R32V2020_Build_V001/db/videoclk_svga_800x600_altpll.v}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/ALU/CCRControl.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/Seven_Seg_4_Digit/Loadable_7S4D_LED.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/StateMachine/Master_State_Machine/OneHotStateMachine.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/VGA/Mem_Mapped_SVGA/VideoClk_SVGA_800x600.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/VGA/Mem_Mapped_SVGA/Video_SVGA_64x32.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/VGA/Mem_Mapped_SVGA/DisplayRam2k.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/VGA/Mem_Mapped_SVGA/CharRom.VHD}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/COUNTER/COUNTER_32.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/Multiplexers/MUX_16x32.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/Registers/REG_32_CONSTANT.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/Registers/REG_32.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/OpCodeDecoder/OpCode_Cat_Decoder.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/ALU/ALU.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/BlockRom_Instruction/BlockRom_Instruction.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/BlockRam_Stack/BlockRam_Stack.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/BlockRam_Data/BlockRam_Data.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/UART/bufferedUART.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/PS2KB/ps2_intf.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/Registers/REG_16.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/VGA/Mem_Mapped_SVGA/Mem_Mapped_SVGA.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/RegisterFile/RegisterFile.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/OpCodeDecoder/OpCodeDecoder.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/PeripheralInterface/PeripheralInterface.vhd}
vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Top_Level_Builds/R32V2020_Build_V001/R32V2020.vhd}

