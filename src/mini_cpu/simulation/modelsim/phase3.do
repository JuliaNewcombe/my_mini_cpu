onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ctrl_unit_tb/clear
add wave -noupdate /ctrl_unit_tb/IncPC
add wave -noupdate /ctrl_unit_tb/strobe
add wave -noupdate /ctrl_unit_tb/Gra
add wave -noupdate /ctrl_unit_tb/Grb
add wave -noupdate /ctrl_unit_tb/Grc
add wave -noupdate /ctrl_unit_tb/Rin
add wave -noupdate /ctrl_unit_tb/Rout
add wave -noupdate /ctrl_unit_tb/PCout
add wave -noupdate /ctrl_unit_tb/MDRout
add wave -noupdate /ctrl_unit_tb/Zhighout
add wave -noupdate /ctrl_unit_tb/Zlowout
add wave -noupdate /ctrl_unit_tb/HIout
add wave -noupdate /ctrl_unit_tb/LOout
add wave -noupdate /ctrl_unit_tb/InPortout
add wave -noupdate /ctrl_unit_tb/Read
add wave -noupdate /ctrl_unit_tb/Write
add wave -noupdate /ctrl_unit_tb/Run
add wave -noupdate /ctrl_unit_tb/HIin
add wave -noupdate /ctrl_unit_tb/LOin
add wave -noupdate /ctrl_unit_tb/CONin
add wave -noupdate /ctrl_unit_tb/PCin
add wave -noupdate /ctrl_unit_tb/IRin
add wave -noupdate /ctrl_unit_tb/Yin
add wave -noupdate /ctrl_unit_tb/Zlowin
add wave -noupdate /ctrl_unit_tb/Zhighin
add wave -noupdate /ctrl_unit_tb/MARin
add wave -noupdate /ctrl_unit_tb/MDRin
add wave -noupdate /ctrl_unit_tb/OutPortin
add wave -noupdate /ctrl_unit_tb/Cout
add wave -noupdate /ctrl_unit_tb/BAOut
add wave -noupdate /ctrl_unit_tb/branchCompare
add wave -noupdate /ctrl_unit_tb/R0out
add wave -noupdate /ctrl_unit_tb/R1out
add wave -noupdate /ctrl_unit_tb/R2out
add wave -noupdate /ctrl_unit_tb/R3out
add wave -noupdate /ctrl_unit_tb/R4out
add wave -noupdate /ctrl_unit_tb/R5out
add wave -noupdate /ctrl_unit_tb/R6out
add wave -noupdate /ctrl_unit_tb/R7out
add wave -noupdate /ctrl_unit_tb/R8out
add wave -noupdate /ctrl_unit_tb/R9out
add wave -noupdate /ctrl_unit_tb/R10out
add wave -noupdate /ctrl_unit_tb/R11out
add wave -noupdate /ctrl_unit_tb/R12out
add wave -noupdate /ctrl_unit_tb/R13out
add wave -noupdate /ctrl_unit_tb/R14out
add wave -noupdate /ctrl_unit_tb/R15out
add wave -noupdate /ctrl_unit_tb/R0in
add wave -noupdate /ctrl_unit_tb/R1in
add wave -noupdate /ctrl_unit_tb/R2in
add wave -noupdate /ctrl_unit_tb/R3in
add wave -noupdate /ctrl_unit_tb/R4in
add wave -noupdate /ctrl_unit_tb/R5in
add wave -noupdate /ctrl_unit_tb/R6in
add wave -noupdate /ctrl_unit_tb/R7in
add wave -noupdate /ctrl_unit_tb/R8in
add wave -noupdate /ctrl_unit_tb/R9in
add wave -noupdate /ctrl_unit_tb/R10in
add wave -noupdate /ctrl_unit_tb/R11in
add wave -noupdate /ctrl_unit_tb/R12in
add wave -noupdate /ctrl_unit_tb/R13in
add wave -noupdate /ctrl_unit_tb/R14in
add wave -noupdate /ctrl_unit_tb/R15in
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInMDRout
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/ZHighWire
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/ZLowWire
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR0
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR1
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR2
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR3
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR4
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR5
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR6
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR7
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR8
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR9
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR10
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR11
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR12
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR13
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR14
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInR15
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInZhigh
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInZlow
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInPCout
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInInPortout
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInYout
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInHI
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInLO
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxInRamout
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/output_data
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/irOut
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/input_data
add wave -noupdate /ctrl_unit_tb/clock
add wave -noupdate /ctrl_unit_tb/Reset
add wave -noupdate /ctrl_unit_tb/Stop
add wave -noupdate /ctrl_unit_tb/Con_FF
add wave -noupdate /ctrl_unit_tb/present_state
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/BusMuxOut
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R0/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R1/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R2/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R3/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R4/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R5/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R6/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R7/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R8/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R9/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R10/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R11/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R12/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R13/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R14/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/R15/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/HI/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/LO/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/Zhigh/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/Zlow/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/PC/q
add wave -noupdate -radix binary /ctrl_unit_tb/dp/MDR/q
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/PC/q
add wave -noupdate -radix hexadecimal {/ctrl_unit_tb/dp/RAM/mem[71]}
add wave -noupdate -radix hexadecimal {/ctrl_unit_tb/dp/RAM/mem[142]}
add wave -noupdate -radix hexadecimal /ctrl_unit_tb/dp/MAR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6294789 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 216
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {6001322 ps} {6427886 ps}
