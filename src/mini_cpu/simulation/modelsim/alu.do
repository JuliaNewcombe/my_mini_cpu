onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_instr_tb/HIOut
add wave -noupdate /alu_instr_tb/LOout
add wave -noupdate /alu_instr_tb/InPortout
add wave -noupdate /alu_instr_tb/Yout
add wave -noupdate /alu_instr_tb/RAMout
add wave -noupdate /alu_instr_tb/CONin
add wave -noupdate /alu_instr_tb/R1out
add wave -noupdate /alu_instr_tb/R2out
add wave -noupdate /alu_instr_tb/R5out
add wave -noupdate /alu_instr_tb/R6out
add wave -noupdate /alu_instr_tb/R7out
add wave -noupdate /alu_instr_tb/R8out
add wave -noupdate /alu_instr_tb/R9out
add wave -noupdate /alu_instr_tb/R10out
add wave -noupdate /alu_instr_tb/R11out
add wave -noupdate /alu_instr_tb/R12out
add wave -noupdate /alu_instr_tb/R13out
add wave -noupdate /alu_instr_tb/R14out
add wave -noupdate /alu_instr_tb/R15out
add wave -noupdate /alu_instr_tb/OutPortin
add wave -noupdate /alu_instr_tb/Write
add wave -noupdate /alu_instr_tb/AND
add wave -noupdate /alu_instr_tb/HIin
add wave -noupdate /alu_instr_tb/Loin
add wave -noupdate /alu_instr_tb/R5in
add wave -noupdate /alu_instr_tb/R6in
add wave -noupdate /alu_instr_tb/R7in
add wave -noupdate /alu_instr_tb/R8in
add wave -noupdate /alu_instr_tb/R9in
add wave -noupdate /alu_instr_tb/R10in
add wave -noupdate /alu_instr_tb/R11in
add wave -noupdate /alu_instr_tb/R12in
add wave -noupdate /alu_instr_tb/R13in
add wave -noupdate /alu_instr_tb/R14in
add wave -noupdate /alu_instr_tb/R15in
add wave -noupdate /alu_instr_tb/clear
add wave -noupdate /alu_instr_tb/strobe
add wave -noupdate /alu_instr_tb/branchCompare
add wave -noupdate /alu_instr_tb/to_decode
add wave -noupdate /alu_instr_tb/Mdatain
add wave -noupdate /alu_instr_tb/input_data
add wave -noupdate /alu_instr_tb/op
add wave -noupdate /alu_instr_tb/mdrData
add wave -noupdate /alu_instr_tb/BusMuxInR8
add wave -noupdate /alu_instr_tb/BusMuxInR9
add wave -noupdate /alu_instr_tb/BusMuxInR10
add wave -noupdate /alu_instr_tb/BusMuxInR11
add wave -noupdate /alu_instr_tb/BusMuxInR12
add wave -noupdate /alu_instr_tb/BusMuxInR13
add wave -noupdate /alu_instr_tb/BusMuxInR14
add wave -noupdate /alu_instr_tb/BusMuxInR15
add wave -noupdate /alu_instr_tb/BusMuxInZhigh
add wave -noupdate /alu_instr_tb/BusMuxInInPortout
add wave -noupdate /alu_instr_tb/BusMuxInYout
add wave -noupdate /alu_instr_tb/BusMuxInHI
add wave -noupdate /alu_instr_tb/BusMuxInLO
add wave -noupdate /alu_instr_tb/BusMuxInRamout
add wave -noupdate /alu_instr_tb/output_data
add wave -noupdate /alu_instr_tb/ZHighWire
add wave -noupdate /alu_instr_tb/ZLowWire
add wave -noupdate /alu_instr_tb/LOin
add wave -noupdate /alu_instr_tb/PCout
add wave -noupdate /alu_instr_tb/Zhighout
add wave -noupdate /alu_instr_tb/Zlowout
add wave -noupdate /alu_instr_tb/MDRout
add wave -noupdate /alu_instr_tb/R0out
add wave -noupdate /alu_instr_tb/R3out
add wave -noupdate /alu_instr_tb/R4out
add wave -noupdate /alu_instr_tb/MARin
add wave -noupdate /alu_instr_tb/Zin
add wave -noupdate /alu_instr_tb/PCin
add wave -noupdate /alu_instr_tb/MDRin
add wave -noupdate /alu_instr_tb/IRin
add wave -noupdate /alu_instr_tb/Yin
add wave -noupdate /alu_instr_tb/IncPC
add wave -noupdate /alu_instr_tb/Read
add wave -noupdate /alu_instr_tb/ZHighin
add wave -noupdate /alu_instr_tb/Zlowin
add wave -noupdate /alu_instr_tb/R0in
add wave -noupdate /alu_instr_tb/R1in
add wave -noupdate /alu_instr_tb/R2in
add wave -noupdate /alu_instr_tb/R3in
add wave -noupdate /alu_instr_tb/R4in
add wave -noupdate /alu_instr_tb/Clock
add wave -noupdate /alu_instr_tb/BAOut
add wave -noupdate /alu_instr_tb/Gra
add wave -noupdate /alu_instr_tb/Grb
add wave -noupdate /alu_instr_tb/Grc
add wave -noupdate /alu_instr_tb/Rin
add wave -noupdate /alu_instr_tb/Rout
add wave -noupdate /alu_instr_tb/Cout
add wave -noupdate /alu_instr_tb/Present_state
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusOut
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR0
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR1
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR2
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR3
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR4
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR5
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR6
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInR7
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInZlow
add wave -noupdate -radix hexadecimal /alu_instr_tb/BusMuxInPCout
add wave -noupdate -radix binary /alu_instr_tb/irOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {741276 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
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
WaveRestoreZoom {560 ns} {1044658 ps}
