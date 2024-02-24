module divide (input [31:0] A, B, output reg [31:0] quotient, remainder);
	
	reg [64:0] c;
	integer index;
	reg [32:0] pos_B, neg_B, temp;
	
	always @(A or B) begin
		temp = 33'b0;
		neg_B = ~{B[31], B} + 1'b1;
		pos_B = {B[31], B};
		if (B[31] == 1'b1) begin
			temp = neg_B;
			neg_B = pos_B;
			pos_B = temp;
		end
		c = {33'b0, A};
				
		for(index = 0; index < 32; index = index + 1) begin
			c = c << 1;
			
			if(c[64] === 1'b1) begin
				c = c + {pos_B, 32'b0};
			end else begin
				c = c + {neg_B, 32'b0};
			end
			
			// if the right most bit is a one the left bit is 0
			c[0] = !c[64];
		end
		if (c[64] == 1'b1) begin
			c = c + {pos_B, 32'b0};
		end
		if (B[31] == 1'b1) quotient = ~c[31:0] + 1'b1;
		else quotient  = c[31:0];
		remainder = c[63:32];
	end

endmodule