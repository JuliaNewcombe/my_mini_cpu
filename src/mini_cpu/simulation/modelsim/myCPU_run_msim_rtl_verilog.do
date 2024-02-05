transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/ripple_carry_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/and_vals.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/or_vals.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/shift_right.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/shift_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/rotate_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/rotate_right.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/not_val.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/negate_val.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/ALU_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/booth_pair_mul.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/divide.v}

vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/Downloads/week1/week1 {C:/Users/18jmcn/Downloads/week1/week1/ALU_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run 500 ns
