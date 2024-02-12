module booth_pair_mul (input [31:0] A, B, output reg [63:0] result, output reg carry_flag);
	
	reg [63:0] c;
	reg [33:0] extended_B;
	reg [63:0] extended_A;
	reg [63:0] extended_neg_A;
	integer multipliers;
	integer index;	
	
	always @(A or B) begin
	
		c = 64'b0;
		extended_B = {B[31], B, 1'b0};
		extended_A = $signed(A);
		extended_neg_A = $signed(~A+1'b1);
		
		for(index = 0; index < 32; index = index + 2) begin
			case(extended_B[2:0])
				3'b001, 3'b010 : 	multipliers = 1;
				3'b011 : 			multipliers = 2;
				3'b100 :	 			multipliers = -2;
				3'b101, 3'b110 : 	multipliers = -1;
				default : 			multipliers = 0;
			endcase
			

			case(multipliers) 
				1 :  c = c + (extended_A<<index);
				2 :  c = c + (extended_A<<(index+1));
				-1 : c = c + (extended_neg_A<<index);
				-2 : c = c + (extended_neg_A<<(index+1));
			endcase
			
			extended_B = extended_B >> 2;
			
		end
		result = c;
	end

endmodule