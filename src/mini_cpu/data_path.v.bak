module DataPath(
	input clock, clear,
	//immediate value IS this even necessary
	input [31:0] A,
	input [31:0] RegisterAImmediate,
	//control signals
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,
	//register enables
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, 
	R12in, R13in, R14in, R15in, HIin, LOin, Zhighin, Zlowin, PCin, MDRin, InPortin, Cin
);	
wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInMDRout, BusMuxInInPortout,
BusMuxInCout, BusMuxOut;
wire [31:0] Zregin;

// init 24 regs here
// confused about register instantiation

// init rest of blocks here

Bus bus(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInMDRout, BusMuxInInPortout,
	BusMuxInCout,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,
	BusMuxOut);
	
endmodule 