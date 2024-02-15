module rotate_right (input [31:0] A, B, output [31:0] result);
	reg [31:0] q;
	always @ (A or B) begin
		q = (A >>  B) | (A << 32-B);
	end
	assign result = q;
endmodule 