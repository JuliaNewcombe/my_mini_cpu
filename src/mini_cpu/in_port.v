module in_port (input clear, clock, strobe, input [31:0] unit_input, output wire [31:0]BusMuxIn);
reg [31:0] temp, q;
reg flag;



always @ (posedge strobe) begin
	temp = unit_input;
end
	
always @(posedge clock) begin
	if (clear) begin
		q <= 0;
	end
	else begin
		q <= temp;
	end
	flag <= 0;
end

assign BusMuxIn = q;

endmodule
