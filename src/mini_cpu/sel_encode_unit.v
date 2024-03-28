module sel_encode(input [31:0] instr, input Gra, Grb, Grc, Rin, Rout, BAout, 
						output [4:0] opcode, output [31:0] C_sign_ext, output R0in, 
						R1in, R2in, R3in, R4in, R5in, R6in, R7in,R8in, R9in, R10in, 
						R11in, R12in, R13in, R14in, R15in, R0out, R1out, R2out, R3out, 
						R4out, R5out, R6out, R7out,R8out, R9out, R10out, R11out, 
						R12out, R13out, R14out, R15out);
						
	wire [15:0] InReg, outReg;
	wire [3:0]  to_decode;
						
	//wire 
	assign to_decode = (instr[26:23] & {4{Gra}} | instr[22:19] & {4{Grb}} | instr[18:15] & {4{Grc}});
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
	
	assign {R15in, R14in, R13in, R12in, R11in, R10in, R9in, R8in,R7in, R6in, R5in, R4in, R3in, R2in, R1in, R0in} = InReg;
	assign {R15out, R14out, R13out, R12out, R11out, R10out, R9out, R8out,R7out, R6out, R5out, R4out, R3out, R2out, R1out, R0out} = outReg;
	
endmodule
