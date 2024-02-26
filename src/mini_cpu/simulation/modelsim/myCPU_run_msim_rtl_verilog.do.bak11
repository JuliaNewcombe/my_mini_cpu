transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/ripple_carry_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/and_vals.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/or_vals.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/shift_right.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/shift_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/rotate_left.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/rotate_right.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/not_val.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/negate_val.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/booth_pair_mul.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/divide.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/data_path.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/MDR_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/reg_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/ror_tb.v}

vlog -vlog01compat -work work +incdir+C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu {C:/Users/adogh/OneDrive/Documents/4th_year/Winter/ELEC374/Lab_repo/my_mini_cpu/src/mini_cpu/ror_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ror_tb

add wave *
view structure
view signals
run 500 ns
