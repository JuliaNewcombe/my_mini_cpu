module in_port (input clear, clock, enable, strobe, input [31:0] unit_input, output wire [31:0]BusMuxIn);
reg [31:0]q;
always @ (posedge strobe)
	begin always @ (posedge clock)
			begin
				if (clear) begin
					q <= 0;
				
				end
				else if (enable) begin
					q <= BusMuxOut;
				end
			end
		end
assign BusMuxIn = q;
endmodule
