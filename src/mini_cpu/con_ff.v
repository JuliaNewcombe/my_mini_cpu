module con_ff (output result, input [31:0] ir, input [31:0] BusMuxOut, input CONin);

reg [3:0] decoder;
wire temp;
wire equal = (BusMuxOut == 32'b0) ? 1'b1 : 1'b0;
wire not_equal = (BusMuxOut != 32'b0) ? 1'b1 : 1'b0;
wire positive = (BusMuxOut[31] == 1'b0) ? 1'b1 : 1'b0;
wire negative = (BusMuxOut[31] == 1'b1) ? 1'b1 : 1'b0;
wire eq, no, pos, neg;

always @ (ir) begin
	case (ir[20:19])
			2'b00: decoder = 4'b0001;
			2'b01: decoder = 4'b0010;
			2'b10: decoder = 4'b0100;
			2'b11: decoder = 4'b1000;
	endcase
end

assign eq = (decoder[0] && equal);
assign no = (decoder[1] && not_equal);
assign pos = (decoder[2] && positive);
assign neg = (decoder[3] &&	negative);
assign temp = (eq || no || pos || neg);

d_flip_flop	CONFF(CONin, temp, result); 

endmodule
