module MDR_reg (input clear, clock, enable, read, 
	input [31:0]BusMuxOut, input [31:0] Mdatain, output wire [31:0]BusMuxIn);
	
reg [31:0]q;

always @ (clock)
		begin
			if (clear) begin
				q <= 0;
			end
			else if (enable) begin
			// if read is one we want Mdatain else we want BusMuxOut
				//q <= read ? Mdatain : BusMuxOut;
				if(read) begin
					q <= Mdatain;
				end else begin
					q <= BusMuxOut;
				end
			end
			/*if (clear) begin
				q <= 32'ha;
			
			end else if (enable && read) begin
				q <= 32'hb;
			
			
			end else if(enable && ~read) begin
				q <= 32'hc;
			 
			end else begin
				q <= 32'b0;
			end*/
		end
	assign BusMuxIn = q;
		
endmodule