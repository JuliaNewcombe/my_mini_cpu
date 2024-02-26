`timescale 1ns/10ps

module negate_tb;

	reg PCout, Zhighout, Zlowout, MDRout, HIOut, LOout, InPortout, Yout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
	reg MARin, Zin, PCin, MDRin, IRin, Yin, InPC, Read, AND, HIin, InPortin, Loin, ZHighin, Zlowin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
	reg Clock, clear;
	reg [31:0] Mdatain;	
	parameter Default = 4'b0000, mdr_load_1 = 4'b0001, Reg_load_1 = 4'b0010, Y_load = 4'b0011, 
				 negate_op = 4'b0100, z_low_read = 4'b0101;
	reg [3:0] Present_state = Default;
	reg [4:0] op;
	wire [31:0] BusOut, mdrData, BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
					BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
					BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO;


	data_path DUT(Clock, clear, Read, op, Mdatain, 
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	HIOut, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Yout, 
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	HIin, LOin, ZHighin, Zlowin, InPC, MDRin, InPortin, Yin, 
	BusOut, mdrData, BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO);

	
initial begin
	Clock = 1;
end


always #10 Clock = ~Clock;
		
		
always @(negedge Clock) begin// finite state machine; if clock falling-edge so as to be offset from reg clocking
	case (Present_state)
		Default : Present_state = mdr_load_1;
		mdr_load_1 : Present_state = Reg_load_1;
		Reg_load_1 : Present_state = Y_load;
		Y_load     : Present_state = negate_op;
		negate_op     : Present_state = z_low_read;
	endcase
end

always @(Present_state) begin // do the required job in each state
	case (Present_state) // assert the required signals in each clock cycle
		Default: begin
			/*PCout <= 0; Zlowout <= 0; MDRout <= 0; // initialize the signals
			R2out <= 0; R3out <= 0; MARin <= 0; Zin <= 0;
			PCin <=0; MDRin <= 0; IRin <= 0; Yin <= 0;
			IncPC <= 0; Read <= 0; AND <= 0;
			R1in <= 0; R2in <= 0; R3in <= 0; Mdatain <= 32'h00000000;*/
			{PCout, Zhighout, Zlowout, MDRout, HIOut, LOout, InPortout, Yout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out} <= 24'b0;
			{MARin, Zin, PCin, MDRin, IRin, Yin, InPC, Read, AND, HIin, InPortin, Loin, ZHighin, Zlowin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in} <= 29'b0;
			clear<=0;
			Mdatain <= 32'h00000000;
			op <= 0;
		end
			
		mdr_load_1: begin
			Mdatain <= 32'd12;
			// the first zero is there for completeness
			#5 Read <= 1; MDRin <= 1;
			#10 Read <= 0; MDRin <= 0;
		end
 
		Reg_load_1: begin
			#5 MDRout <= 1; R7in <= 1;
			#10 MDRout <= 0; R7in <= 0; // initialize R2 with the value $12
		end
		
		Y_load: begin
			#5 R7out <= 1; Yin <= 1;
			#10 R7out <= 0; Yin <= 0; // initialize R2 with the value $12
		end

		negate_op: begin
			op <= 5'b01000;
			#5 R7out <= 1; Zlowin <= 1;
			#10 R7out <= 0; Zlowin <= 0;
		end
 
		z_low_read: begin
			#5 Zlowout <= 1; R6in <= 1;
			#10 Zlowout <= 0; R6in <= 0; // initialize R1 with the value $18
		end

	endcase
end

endmodule 