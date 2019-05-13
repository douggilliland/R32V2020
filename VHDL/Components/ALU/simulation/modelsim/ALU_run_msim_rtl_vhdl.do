transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/HPz420/Documents/GitHub/R32V2020/VHDL/Components/ALU/ALU.vhd}

