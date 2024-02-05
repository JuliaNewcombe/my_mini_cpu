module rotate_right (input [31:0] A, input amnt, output [31:0] result);
	
	assign result = (A >> amnt) | (A << 32-amnt);
	
endmodule