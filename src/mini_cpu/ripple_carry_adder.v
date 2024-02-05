module ripple_carry_adder(input [31:0] A, B, output reg [31:0] sum, output reg carry_flag, overflow_flag);
	
	reg [32:0] carry;
	integer    index;
	//reg [31:0] a_input = A;
	//reg [31:0] b_input = B;
	
	always @(A or B) begin
	
		carry = 33'b0;
		
		for(index = 0; index < 32; index = index + 1) begin
			sum[index] = A[index]^B[index]^carry[index];
			carry[index+1] = (A[index]&B[index])|(carry[index]&(A[index]|B[index]));
		end
		
		overflow_flag = (A[31]&B[31]&(~carry[32])) | ((~A[31])&(~B[31])&(carry[32]));
		carry_flag   = carry[32];
		
	end

endmodule