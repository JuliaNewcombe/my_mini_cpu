module r0 (input clear, clock, enable, BAout, input [31:0]BusMuxOut, output wire [31:0]BusMuxIn);
reg [31:0] q;

reg_31 this_reg(clear, clock, enable, BusMuxOut, q)

always @(clock) begin
	if(BAout == 1'b1) begin 
		BusMuxIn <= 32'b0;
	else begin
		BusMuxIn <= q;
	end

end

endmodule
