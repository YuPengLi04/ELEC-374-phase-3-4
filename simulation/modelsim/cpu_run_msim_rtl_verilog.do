transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/Bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/DataPath.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/MDR.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/BoothMul.V}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/div.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/sub.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/Select_and_encode.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/CON_FF.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/register_zero.v}
vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/RAM.v}

vlog -vlog01compat -work work +incdir+C:/Users/jaeso/Downloads/ELEC374-main {C:/Users/jaeso/Downloads/ELEC374-main/Load_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Load_tb

add wave *
view structure
view signals
run 500 ns
