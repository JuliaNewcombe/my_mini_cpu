module MDR_reg (input clear, clock, enable, read, 
	input [31:0]BusMuxOut, input [31:0] Mdatain, output wire [31:0]BusMuxIn);
reg [31:0]q;
always @ (posedge clock)
		begin
			if (clear) begin
				q <= 0;
			end
			else if (enable) begin
			// if read is one we want Mdatain else we want BusMuxOut
				q <= read ? Mdatain : BusMuxOut;
			end
		end
	assign BusMuxIn = q;
endmodule


	