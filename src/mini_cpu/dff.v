module d_flip_flop(input CONin, D, output reg Q);
initial begin 
	Q <= 0;
end
always @ (CONin) begin
	Q <= D;
end
endmodule 