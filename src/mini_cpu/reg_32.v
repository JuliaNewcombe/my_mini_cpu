module reg_32 (input clear, clock, enable, input [31:0]BusMuxOut, output wire [31:0]BusMuxIn);
reg [31:0]q;
always @ (posedge clock)
		begin
			if (clear) begin
				q <= 0;
				
			end
			else if (enable) begin
				q <= BusMuxOut;
			end
		end
	assign BusMuxIn = q;
endmodule
