module negate_val (input [31:0] A, output [31:0] result);

	reg [31:0] intermediate;
	wire flag1, flag2;
	integer iter;
	
	always @(*) begin
		intermediate = A;
		for (iter = 0; iter < 32; iter = iter +1) begin
			intermediate[iter] = !intermediate[iter];
		end
	end
	ripple_carry_adder add_one(intermediate, 32'b1, result, flag1, flag2);
	
endmodule