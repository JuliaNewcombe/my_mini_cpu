`timescale 1ns/10ps
module ALU_tb;

	reg  [31:0] A, B;
	reg  [4:0]  opcode;
	wire [31:0] Zlowout;
	wire [31:0] Zhighout;
	
	ALU ALU_instance(A, B, opcode, Zlowout, Zhighout);
	
	initial begin
		A <= -7;
		B <= 10;
		opcode <= 0;
		
		#30
		
		A <= 32'b1111111111;
		B <= 32'b1010101010;
		opcode <= 1;
		
		#30
		
		opcode <= 2;
		
		#10
		B <= 5;
		
		opcode <= 3;
		
		#30
		
		A <= -5;
		opcode <= 4;
		
		#30
		
		opcode <= 5;
		
		#30
		
		opcode <= 6;
		
		#30
		
		opcode <= 7;
		
		#30
		
		opcode <= 8;
		
		#30
		
		opcode <= 9;
		A <= 30;
		
		#30
		A <= 5;
		B <= 5;
		opcode <= 10;

		
		#30
		A <= 5;
		B <= -17;
		
		#30
		A <= 25;
		B <= 8;
		opcode <= 11;

		
		#30
		A <= 30;
		B <= -9;
		

	end
	
endmodule 