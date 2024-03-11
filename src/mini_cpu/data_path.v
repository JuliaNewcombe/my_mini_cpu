module data_path(
	input clock, clear, Read, Write, strobe, BAOut, Gra, Grb, Grc, Rin, Rout,
	input [31:0] input_data, irIn,
	//control signals
	input HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Yout, RAMout, Cout,
	//register enables
	input HIin, LOin, Zhighin, Zlowin, PCin, MDRin, OutPortin, Yin, MARin, IncPC,
	output [31:0] BusMuxOut, BusMuxInMDRout, ZHighWire, ZLowWire,
	BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO, BusMuxInRamout, output_data, irOut,
	output branchCompare,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	output [3:0] to_decode

);	
//wire [31:0] ZHighWire, ZLowWire, 
wire [31:0] C_sign_ext;
reg [31:0] yALUin;
wire [8:0] MARAddr;
wire [4:0] op;
//wire [31:0] Zregin;

//wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
//wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;

// init 24 regs here
r0		 R0(clear, clock, R0in, BAOut, BusMuxOut, BusMuxInR0);
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
in_port InPort(clear, clock, strobe, input_data, BusMuxInInPortout);
reg_32 Y(clear, clock, Yin, BusMuxOut, BusMuxInYout);
reg_32 OutPort(clear, clock, OutPortin, BusMuxOut, output_data);
mar	 MAR(clear, clock, MARin, BusMuxOut, MARAddr);

// init ALU
/*always @(IncPC) begin
	PC = PC + 4;
end*/

ALU alu(BusMuxInYout, BusMuxOut, op, ZLowWire, ZHighWire);

//init RAM
ram RAM(clock, Read, Write, MARAddr, BusMuxOut, MDataIn);
//note that righ now we have the same read signals for the MDR and the RAM

// init rest of blocks here

Bus bus(BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInMDRout, BusMuxInInPortout,
	C_sign_ext,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,
	BusMuxOut);
	
//init con_ff here
reg_32 ir(clear, clock, 1'b1, irIn, irOut);
con_ff CON_FF(branchCompare, irOut, BusMuxOut, clock);


//init select and encode logic
sel_encode SEL_ENCODE(irOut, Gra, Grb, Grc, Rin, Rout, BAOut, op, 
	C_sign_ext, 
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, 
	R11in, R12in, R13in, R14in, R15in, 
	R0out, R1out, R2out, R3out, 
	R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
	R12out, R13out, R14out, R15out, to_decode);

endmodule 