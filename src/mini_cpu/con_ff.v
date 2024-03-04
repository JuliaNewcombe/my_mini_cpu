module con_ff (output result, input [31:0] ir, input [31:0] BusMuxOut);

reg [3:0] decoder

always @(ir) begin
	case (ir[20:19])
		
		00 : decoder <= 4'b0001;
		01 : decoder <= 4'b0010;
		10 : decoder <= 4'b0100;
		11 : decoder <= 4'b1000;

	endcase
	
	
		
end

endmodule
