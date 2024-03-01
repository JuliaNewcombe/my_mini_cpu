module ram (input clock, read, write, input [8:0] addr, input [31:0] BusMuxOut, output wire [31:0]BusMuxIn);

reg [511:0] mem [31:0];
reg [32:0] 	q;

always @ (posedge clock)begin
             		if (write) begin
                                mem[addr] <= BusMuxOut;
                        end
                        else if (read) begin
                                q <= mem[addr];
                        end
	end
	
assign BusMuxIn = q;
	
endmodule
