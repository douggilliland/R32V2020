vcom -work work ADD_AND_Waveform.vwf.vht
vsim -novopt -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.ALU_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
