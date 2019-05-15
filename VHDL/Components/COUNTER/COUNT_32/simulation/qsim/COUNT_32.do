onerror {exit -code 1}
vlib work
vcom -work work COUNT_32.vho
vcom -work work Waveform.vwf.vht
vsim -novopt -c -t 1ps -sdfmax COUNT_32_vhd_vec_tst/i1=COUNT_32_vhd.sdo -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.COUNT_32_vhd_vec_tst
vcd file -direction COUNT_32.msim.vcd
vcd add -internal COUNT_32_vhd_vec_tst/*
vcd add -internal COUNT_32_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
