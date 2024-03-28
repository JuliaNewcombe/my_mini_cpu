`timescale 1ns/10ps

module ctrl_unit_tb;

wire clear, IncPC, strobe, Gra, Grb, Grc, Rin, Rout, PCout, MDRout, Zhighout, Zlowout, HIout, LOout, InPortout, Read, 
Write, Run, HIin, LOin, CONin, PCin, IRin, Yin, Zlowin, Zhighin, MARin, MDRin, OutPortin, Cout, BAOut, branchCompare,
R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
wire [31:0] BusMuxOut, BusMuxInMDRout, ZHighWire, ZLowWire, BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, 
BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, 
BusMuxInR15, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO, 
BusMuxInRamout, output_data, irOut;
reg [31:0] input_data;
reg clock, Reset, Stop, Con_FF;
wire [9:0] present_state;

data_path dp(
	present_state,
	clear, IncPC, strobe,
	Gra, Grb, Grc, Rin, Rout, 
   PCout, MDRout, Zhighout, Zlowout, HIout, LOout,
   InPortout, Read, Write, Run,
   HIin, LOin, CONin, PCin, IRin, Yin, Zlowin, Zhighin, MARin, MDRin, OutPortin, Cout, BAOut,
	BusMuxOut, BusMuxInMDRout, ZHighWire, ZLowWire,
	BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO, BusMuxInRamout, output_data, irOut,
	branchCompare,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	input_data,
   clock, Reset, Stop, Con_FF
);	

initial begin
	clock <= 1;
	Reset <= 0;
	Stop  <= 0;
	Con_FF<= 0;
	
	#50
	
	Reset <= 1;
	
	#20
	
	Reset <= 0;
end


always #5 clock = ~clock;

endmodule