module sel_encode(input [31:0] instr, input Gra, Grb, Grc, Rin, Rout, BAout, 
						output [4:0] opcode, output [31:0] C_sign_ext, output R0in, 
						R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, 
						R11in, R12in, R13in, R14in, R15in, R0out, R1out, R2out, R3out, 
						R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
						R12out, R13out, R14out, R15out);
						
	wire [15:0] InReg, outReg;
						
	wire to_decode = (instr[26:23] & {4{Gra}} | instr[22:19] & {4{Grb}} | instr[18:15] & {4{Grc}});
	reg [15:0] decode_out;
	// 4:16 decoder logic
	always @ (to_decode) begin
				case (to_decode)
						4'b0000 : decode_out <= 16'b0000_0000_0000_0001;     
						4'b0001 : decode_out <= 16'b0000_0000_0000_0010;   
						4'b0010 : decode_out <= 16'b0000_0000_0000_0100; 
						4'b0011 : decode_out <= 16'b0000_0000_0000_1000;  
						4'b0100 : decode_out <= 16'b0000_0000_0001_0000;    
						4'b0101 : decode_out <= 16'b0000_0000_0010_0000;   
						4'b0110 : decode_out <= 16'b0000_0000_0100_0000;
						4'b0111 : decode_out <= 16'b0000_0000_1000_0000;    
						4'b1000 : decode_out <= 16'b0000_0001_0000_0000;    
						4'b1001 : decode_out <= 16'b0000_0010_0000_0000;    
						4'b1010 : decode_out <= 16'b0000_0100_0000_0000;   
						4'b1011 : decode_out <= 16'b0000_1000_0000_0000;  
						4'b1100 : decode_out <= 16'b0001_0000_0000_0000;  
						4'b1101 : decode_out <= 16'b0010_0000_0000_0000;    
						4'b1110 : decode_out <= 16'b0100_0000_0000_0000;   
						4'b1111 : decode_out <= 16'b1000_0000_0000_0000; 
				endcase
	end
	assign opcode = instr[31:27];
	assign InReg = {16{Rin}} & decode_out;
	assign outReg = ({16{Rout}} | {16{BAout}}) & decode_out;
	assign C_sign_ext = {{13{instr[18]}}, instr[18:0]};
	
	assign {R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in} = InReg;
	assign {R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out} = outReg;
	
	/*always @(InReg) begin
		if (InReg[0] == 1'b1) {R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in} = 16'b0000_0000_0000_0001;
		else if (InReg[0] == 1'b1) R0in = 1'b1;
		else if (InReg[1] == 1'b1) R1in = 1'b1;
		else if (InReg[2] == 1'b1) R2in = 1'b1;
		else if (InReg[3] == 1'b1) R3in = 1'b1;
		else if (InReg[4] == 1'b1) R4in = 1'b1;
		else if (InReg[5] == 1'b1) R5in = 1'b1;
		else if (InReg[6] == 1'b1) R6in = 1'b1;
		else if (InReg[7] == 1'b1) R7in = 1'b1;
		else if (InReg[8] == 1'b1) R8in = 1'b1;
		else if (InReg[9] == 1'b1) R9in = 1'b1;
		else if (InReg[10] == 1'b1) R10in = 1'b1;
		else if (InReg[11] == 1'b1) R11in = 1'b1;
		else if (InReg[12] == 1'b1) R12in = 1'b1;
		else if (InReg[13] == 1'b1) R13in = 1'b1;
		else if (InReg[14] == 1'b1) R14in = 1'b1;
		else if (InReg[15] == 1'b1) R15in = 1'b1;
	end
	
	always @(outReg) begin
		{R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out} = 16'b0;
		if (outReg[0] == 1'b1) R0out = 1'b1;
		else if (outReg[0] == 1'b1) R0out = 1'b1;
		else if (outReg[1] == 1'b1) R1out = 1'b1;
		else if (outReg[2] == 1'b1) R2out = 1'b1;
		else if (outReg[3] == 1'b1) R3out = 1'b1;
		else if (outReg[4] == 1'b1) R4out = 1'b1;
		else if (outReg[5] == 1'b1) R5out = 1'b1;
		else if (outReg[6] == 1'b1) R6out = 1'b1;
		else if (outReg[7] == 1'b1) R7out = 1'b1;
		else if (outReg[8] == 1'b1) R8out = 1'b1;
		else if (outReg[9] == 1'b1) R9out = 1'b1;
		else if (outReg[10] == 1'b1) R10out = 1'b1;
		else if (outReg[11] == 1'b1) R11out = 1'b1;
		else if (outReg[12] == 1'b1) R12out = 1'b1;
		else if (outReg[13] == 1'b1) R13out = 1'b1;
		else if (outReg[14] == 1'b1) R14out = 1'b1;
		else if (outReg[15] == 1'b1) R15out = 1'b1;
	end*/
				
endmodule
