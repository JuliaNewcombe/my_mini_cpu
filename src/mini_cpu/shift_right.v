module shift_right (input [31:0] A, B, input sign, output [31:0] result);
	//sign indicates whether we are preserving the sign of the value with a shift right
	
	integer iter;
	reg new_sign;
	reg [31:0] intermediate;
	
	always@(A or B or sign) begin
		new_sign = A[31] & sign;
		if (sign == 0) begin 
			intermediate = A >> B;
		end
		//amnt = B;
		else if(sign == 1) begin
			intermediate = $signed(A) >>> B;
		end
	end
	
	assign result = intermediate;
	
endmodule