module ALU(input [31:0] A, B, input [4:0] op, output reg[31:0] Zlowout, Zhighout);

	wire [31:0] add_result, sub_result, and_result, or_result, sll_result, slr_result, slra_result, rol_result, ror_result, not_result, negate_result, divide_result, divide_remainder;
	wire [64:0] mul_result;
	wire carry_flag, overflow_flag;
	reg my_one = 1'b1;
	reg my_zero = 1'b0;
	//integer my_int = 1;
	reg [63:0] Z = 64'b0;

	
	
	ripple_carry_adder add_instance(A, B, add_result, carry_flag, overflow_flag);
	and_vals 			 and_instance(A, B, and_result);
	or_vals            or_instance(A, B, or_result);
	shift_left         sll_instance(A, B, sll_result);
	shift_right 	    slr_instance(A, B, my_zero, slr_result);
	shift_right 	    slra_instance(A, B, my_one, slra_result);
	rotate_left        rol_instance(A, B, rol_result);
	rotate_right       ror_instance(A, B, ror_result);
	not_val            not_instance(A, not_result);
	negate_val         negate_instance(A, negate_result);
	booth_pair_mul		 booth_instance(A, B, mul_result, carry_flag);
	divide				 divide_instance(A, B, divide_result, divide_remainder);
	
	always @(*) begin
		case (op)
			0 : Z = add_result;
			1 : Z = and_result;
			2 : Z = or_result;
			3 : Z = sll_result;
			4 : Z = slr_result;
			5 : Z = slra_result;
			6 : Z = rol_result;
			7 : Z = ror_result;
		   8 : Z = not_result;
			9 : Z = negate_result;
			10: Z = mul_result;
			11: Z = {divide_remainder, divide_result};
		endcase
		Zlowout = Z[31:0];
		Zhighout = Z[63:32];
	end
	
endmodule

















