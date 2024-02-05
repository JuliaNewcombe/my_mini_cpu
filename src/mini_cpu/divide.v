module divide (input [31:0] A, B, output reg [31:0] quotient, remainder);
	
	reg [63:0] c;
	integer index;
	wire [31:0] pos_B, neg_B;
	
	negate_val negate_B(B, neg_B);
	assign pos_B = B;
	//initial implementation assuming A and B are positive
	always @(A or B) begin
	
		c = {32'b0, A};
				
		for(index = 0; index < 32; index = index + 1) begin
			c = c<<1;
			
			if(c[63] === 1'b1) begin
				c = c + {pos_B, 32'b0};
			end else begin
				c = c + {neg_B, 32'b0};
			end
			

			if(c[63] === 1'b1) begin
				c[0] = 1'b0;
			end else begin
				c[0] = 1'b1;
			end
		end
		
		quotient  = c[31:0];
		remainder = c[63:32];
	end

endmodule