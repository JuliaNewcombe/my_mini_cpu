transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/ripple_carry_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/and_vals.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/or_vals.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/shift_right.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/shift_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/rotate_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/rotate_right.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/not_val.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/negate_val.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/booth_pair_mul.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/divide.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/data_path.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/MDR_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/reg_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/in_port.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/mar.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/r0.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/sel_encode_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/con_ff.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/dff.v}
vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/ld_and_st_tb.v}

vlog -vlog01compat -work work +incdir+C:/Users/18jmcn/my_mini_cpu/src/mini_cpu {C:/Users/18jmcn/my_mini_cpu/src/mini_cpu/ld_and_st_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ld_and_st_tb

add wave *
view structure
view signals
run 2000 ns
