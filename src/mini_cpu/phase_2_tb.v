`timescale 1ns/10ps

module phase_2_tb;

	reg PCout, Zhighout, Zlowout, MDRout, HIOut, LOout, InPortout, Yout, RAMout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
	reg MARin, Zin, PCin, MDRin, IRin, OutPortin, Yin, InPC, Read, Write, AND, HIin, Loin, ZHighin, Zlowin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
	reg Clock, clear, strobe, BAOut;
	reg [31:0] Mdatain, input_data;	
	parameter Default = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011, 
				 s4 = 4'b0100, s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111, s8 = 4'b1000, s9 = 4'b1001;
	reg [3:0] Present_state = Default;
	reg [4:0] op;
	wire [31:0] BusOut, mdrData, BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
					BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
					BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO, BusMuxInRamout, output_data;


	data_path DUT(Clock, clear, Read, Write, strobe, BAOut, op, Mdatain, input_data,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	HIOut, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Yout, RAMout, 
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	HIin, LOin, ZHighin, Zlowin, InPC, MDRin, OutPortin, Yin, MARin,
	BusOut, mdrData, BusMuxInR0, BusMuxInR1, BusMuxInR2,  BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
	BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, 
	BusMuxInZhigh, BusMuxInZlow, BusMuxInPCout, BusMuxInInPortout, BusMuxInYout, BusMuxInHI, BusMuxInLO, BusMuxInRamout, output_data);

	
initial begin
	Clock = 1;
end


always #10 Clock = ~Clock;
		
		
always @(negedge Clock) begin// finite state machine; if clock falling-edge so as to be offset from reg clocking
	case (Present_state)
		Default : Present_state = s1;
		s1 : Present_state = s2;
		s2 : Present_state = s3;
		s3 : Present_state = s4;
		s4 : Present_state = s5;
		s5 : Present_state = s6;
		s6	: Present_state = s7;
		s7	: Present_state = s8;
		s8	: Present_state = s9;
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
			{MARin, Zin, PCin, MDRin, IRin, Yin, InPC, Read, AND, HIin, InPortout, Loin, ZHighin, Zlowin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in} <= 29'b0;
			clear<=0;
			Mdatain <= 32'h00000000;
			op <= 0;
			BAOut <= 0;
		end
			
		s1 : begin
			Mdatain <= 32'd3; //load mdr
			#5 Read <= 1; MDRin <= 1; 
			#10 Read <= 0; MDRin <= 0;
		end
 
		s2 : begin
			#5 MDRout <= 1; R0in <= 1; //load R0 with MDR data
			#10 MDRout <= 0; R0in <= 0; 
		end
		
		s3 : begin
			#5 R0out <= 1; BAOut  <= 1;
			#10 R0out <= 0; BAOut <= 0; // try to put R0 on the bus - should fail
		end

		s4 : begin
			#5 R0out <= 1; BAOut  <= 0; //Ro should now succeed in outputing to the bus
			#10 R0out <= 0; BAOut <= 0;
		end
 
		s5 : begin
			#5 OutPortin <= 1; 	//send something through the output, should see on output data
			#10 OutPortin <= 0;
		end

		s6 : begin
			input_data <= 32'hffff; //load something to the input
			#2 strobe <= 1;
			#3 strobe <= 0; 
		end
			
		s7 : begin
			#5 MDRout <= 1; MARin <= 1; //load MAR with an addr
			#10 MDRout <= 0; MARin <= 0;
		end
		
		 
		s8 : begin
			#5 InPortout <= 1; Write <= 1; //load inport data into ram
			#10 InPortout <= 0; Write <= 0;
		end
		
		s9 : begin
			#5 Read <= 1; RAMout = 1; //read contents just written to RAM onto the bus
			#10 Read <= 0; RAMout = 0;
		end

	endcase
end

endmodule 