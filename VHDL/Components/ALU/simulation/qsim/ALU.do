onerror {exit -code 1}
vlib work
vcom -work work ALU.vho
vcom -work work ADD_AND_Waveform-2.vwf.vht
vsim -novopt -c -t 1ps -sdfmax ALU_vhd_vec_tst/i1=ALU_vhd.sdo -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.ALU_vhd_vec_tst
vcd file -direction ALU.msim.vcd
vcd add -internal ALU_vhd_vec_tst/*
vcd add -internal ALU_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f


