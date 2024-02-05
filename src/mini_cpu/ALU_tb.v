`timescale 1ns/10ps
module ALU_tb;

	reg  [31:0] A, B;
	reg  [4:0]  opcode;
	wire [31:0] result;
	
	ALU ALU_instance(A, B, opcode, result);
	
	initial begin
		A <= -7;
		B <= 10;
		opcode <= 0;
		
		#10
		
		A <= 32'b1111111111;
		B <= 32'b1010101010;
		opcode <= 1;
		
		#10
		
		opcode <= 2;
		
		#10
		
		opcode <= 3;
		
		#10
		
		A <= -5;
		opcode <= 4;
		
		#10
		
		opcode <= 5;
		
		#10
		
		opcode <= 6;
		
		#10
		
		opcode <= 7;
		
		#10
		
		opcode <= 8;
		
		#10
		
		opcode <= 9;
		
		#10
		
		opcode <= 10;
		A <= 5;
		B <= 5;
		
		#10
		A <= -5;
		B <= 5;
		
		#10
		
		opcode <= 11;
		A <= 25;
		B <= 5;
		
		#10
		A <= 30;
		B <= 6;
		

	end
	
endmodule