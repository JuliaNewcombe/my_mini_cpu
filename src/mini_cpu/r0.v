module r0 (input clear, clock, enable, BAout, input [31:0]BusMuxOut, output wire [31:0]BusMuxIn);
reg [31:0] q;
wire [31:0] temp_BusMuxIn;

reg_32 this_reg(clear, clock, enable, BusMuxOut, temp_BusMuxIn);

always @(posedge clock) begin
	if(BAout == 1'b1) begin 
		q <= 32'b0;
	end else begin
		q <= temp_BusMuxIn;
	end

end

assign BusMuxIn = q;

endmodule
