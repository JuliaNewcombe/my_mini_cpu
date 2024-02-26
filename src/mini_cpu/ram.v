module ram (input clock, read, write, input [8:0] addr, input [31:0] BusMuxOut, output wire [31:0]BusMuxIn);

reg [511:0] mem [31:0];

always @ (posedge clock)begin
             		if (write) begin
                                mem[addr] <= BusMuxOut;
                        end
                        else if (read) begin
                                BusMuxIn <= mem[addr];
                        end
	end
endmodule
