onerror {exit -code 1}
vlib work
vcom -work work REG_32_LD_At_Reset.vho
vcom -work work Waveform.vwf.vht
vsim -novopt -c -t 1ps -sdfmax REG_32_LD_At_Reset_vhd_vec_tst/i1=REG_32_LD_At_Reset_vhd.sdo -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.REG_32_LD_At_Reset_vhd_vec_tst
vcd file -direction REG_32_LD_At_Reset.msim.vcd
vcd add -internal REG_32_LD_At_Reset_vhd_vec_tst/*
vcd add -internal REG_32_LD_At_Reset_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
