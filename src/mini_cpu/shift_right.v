module shift_right (input [31:0] A, input amnt, input sign, output [31:0] result);
	//sign indicates whether we are preserving the sign of the value with a shift right
	
	integer iter;
	reg new_sign;
	reg [31:0] intermediate;
	
	
	always@(A or amnt or sign) begin
		new_sign = A[31] & sign;
		intermediate = A >> amnt;
		if(sign == 1) begin
			for(iter = 0; iter <amnt; iter = iter + 1) begin
				intermediate[31 - iter] = sign;
			end
		end
	end
	
	assign result = intermediate;
	
endmodule