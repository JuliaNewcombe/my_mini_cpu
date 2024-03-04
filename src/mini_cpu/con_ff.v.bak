module con_ff (output logic, input [31:0] ir, input [31:0] BusMuxOut);

always @(ir) begin
	case (ir[])
		
		00 : logic <= (BusMuxOut == 0);
		01 : logic <= (BusMuxOut != 0);
		10 : logic <= (BusMuxOut >  0);
		11 : logic <= (BusMuxOut <  0);

	endcase
		
end

endmodule
