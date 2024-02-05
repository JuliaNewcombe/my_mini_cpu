module shift_left (input [31:0] A, input amnt, output [31:0] result);
	
	assign result = A << amnt;
	
endmodule