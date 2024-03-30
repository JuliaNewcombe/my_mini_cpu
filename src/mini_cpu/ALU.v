module ALU(input [31:0] A, B, input [4:0] op, output reg[31:0] Zlowout, Zhighout);

	wire [31:0] add_result, sub_result, and_result, or_result, sll_result, slr_result, slra_result, rol_result, ror_result, not_result, negate_result, divide_result, divide_remainder;
	wire [63:0] mul_result;
	wire carry_flag_add, overflow_flag_add, carry_flag_sub, overflow_flag_sub;
	reg my_one = 1'b1;
	reg my_zero = 1'b0;
	//integer my_int = 1;
	reg [63:0] Z = 64'b0;

	
	
	ripple_carry_adder add_instance(A, B, add_result, carry_flag_add, overflow_flag_add);
	ripple_carry_adder sub_instance(A, -B, sub_result, carry_flag_sub, overflow_flag_sub);
	and_vals 			 and_instance(A, B, and_result);
	or_vals            or_instance(A, B, or_result);
	shift_left         sll_instance(A, B, sll_result);
	shift_right 	    slr_instance(A, B, my_zero, slr_result);
	shift_right 	    slra_instance(A, B, my_one, slra_result);
	rotate_left        rol_instance(A, B, rol_result);
	rotate_right       ror_instance(A, B, ror_result);
	not_val            not_instance(B, not_result);
	negate_val         negate_instance(B, negate_result);
	booth_pair_mul		 booth_instance(A, B, mul_result, carry_flag);
	divide				 divide_instance(A, B, divide_result, divide_remainder);
	
	always @(*) begin
		case (op)
			5'b00011, 5'b01100 : Z = add_result;
			5'b00100 : Z = sub_result;
			5'b01010, 5'b01101 : Z = and_result;
			5'b01011, 5'b01110 : Z = or_result;
			5'b00111 : Z = sll_result;
			5'b00101 : Z = slr_result;
			5'b00110 : Z = slra_result;
			5'b01001 : Z = rol_result;
			5'b01000 : Z = ror_result;
		   5'b10010 : Z = not_result;
			5'b10001 : Z = negate_result;
			5'b01111 : Z = mul_result;
			5'b10000 : Z = {divide_remainder, divide_result};
			default : Z = add_result;
		endcase
		Zlowout = Z[31:0];
		Zhighout = Z[63:32];
	end
	
endmodule

















