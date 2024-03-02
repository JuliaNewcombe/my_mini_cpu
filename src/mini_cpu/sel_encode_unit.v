module sel_encode(input [31:0] instr, input Gra, Grb, Grc, Rin, Rout, BAout, 
						output [4:0] opcode, output [31:0] C_sign_ext, output [15:0] InReg, OutReg);
						
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
	assign OutReg = ({16{Rout}} | {16{BAout}}) & decode_out;
	assign C_sign_ext = {{13{instr[18]}}, instr[18:0]};
				
endmodule
