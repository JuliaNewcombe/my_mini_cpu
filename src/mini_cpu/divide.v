module divide (input [31:0] A, B, output reg [31:0] quotient, remainder);
	
	reg [63:0] c;
	integer index;
	wire [31:0] pos_A, neg_A;
	
	negate_val negate_A(A, neg_A);
	assign pos_A = A;
	//initial implementation assuming A and B are positive
	always @(A or B) begin
	
		c = {32'b0, B};
		
		c = c + (A<<32);
		
		for(index = 0; index < 32; index = index + 1) begin
			c = c<<1;
			if(c[63] == 1) begin
				c[0] = 0;
				c = c + (neg_A <<32);
			end else begin
				c[1] = 1;
				c = c + (pos_A <<32);
				
			end
			
		end
		
		quotient  = c[31:0];
		remainder = c[63:32];
	end

endmodule