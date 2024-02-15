module data_path(
	input clock, clear, Read,
	//immediate value IS this even necessary
	input [4:0] op,
	input [31:0] MDataIn,
	//control signals
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Yout,
	//register enables
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, 
	R12in, R13in, R14in, R15in, HIin, LOin, Zhighin, Zlowin, PCin, MDRin, InPortin, Yin,
	output [31:0] BusMuxOut, output [31:0] BusMuxInMDRout, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInYout
);	
wire [31:0] BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, ZHighWire, ZLowWire;
//BusMuxOut,  BusMuxInMDRout, BusMuxInR0, BusMuxInR1, BusMuxInR2 BusMuxInYout
//wire [31:0] Zregin;

// init 24 regs here
reg_32 R0(clear, clock, R0in, BusMuxOut, BusMuxInR0);
reg_32 R1(clear, clock, R1in, BusMuxOut, BusMuxInR1);
reg_32 R2(clear, clock, R2in, BusMuxOut, BusMuxInR2);
reg_32 R3(clear, clock, R3in, BusMuxOut, BusMuxInR3);
reg_32 R4(clear, clock, R4in, BusMuxOut, BusMuxInR4);
reg_32 R5(clear, clock, R5in, BusMuxOut, BusMuxInR5);
reg_32 R6(clear, clock, R6in, BusMuxOut, BusMuxInR6);
reg_32 R7(clear, clock, R7in, BusMuxOut, BusMuxInR7);
reg_32 R8(clear, clock, R8in, BusMuxOut, BusMuxInR8);
reg_32 R9(clear, clock, R9in, BusMuxOut, BusMuxInR9);
reg_32 R10(clear, clock, R10in, BusMuxOut, BusMuxInR10);
reg_32 R11(clear, clock, R11in, BusMuxOut, BusMuxInR11);
reg_32 R12(clear, clock, R12in, BusMuxOut, BusMuxInR12);
reg_32 R13(clear, clock, R13in, BusMuxOut, BusMuxInR13);
reg_32 R14(clear, clock, R14in, BusMuxOut, BusMuxInR14);
reg_32 R15(clear, clock, R15in, BusMuxOut, BusMuxInR15);
reg_32 HI(clear, clock, HIin, BusMuxOut, BusMuxInHI);
reg_32 LO(clear, clock, LOin, BusMuxOut, BusMuxInLO);
reg_32 Zhigh(clear, clock, Zhighin, ZHighWire, BusMuxInZhigh);
reg_32 Zlow(clear, clock, Zlowin, ZLowWire, BusMuxInZlow);
reg_32 PC(clear, clock, PCin, BusMuxOut, BusMuxInPCout);
// reg_32 MAR(clear, clock, MARin, BusMuxOut, BusMuxInPCout);
MDR_reg MDR(clear, clock, MDRin, Read, BusMuxOut, MDataIn, BusMuxInMDRout);
reg_32 InPort(clear, clock, InPortin, BusMuxOut, BusMuxInInPortout);
reg_32 Y(clear, clock, Yin, BusMuxOut, BusMuxInYout);

// init ALU
ALU alu(BusMuxInYout, BusMuxOut, op, ZLowWire, ZHighWire);

// init rest of blocks here

Bus bus(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInMDRout, BusMuxInInPortout,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout,
	BusMuxOut);
	
/*Bus(
BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInMDRout, BusMuxInInPortout,BusMuxInYout,
R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Yout, 
BusMuxOut);*/
	
endmodule 