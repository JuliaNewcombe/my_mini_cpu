module ram (input clock, read, write, input [8:0] addr, input [31:0] BusMuxOut, output wire [31:0] MDataIn);

reg [31:0] mem [511:0];
reg [31:0] 	q;

initial begin
	//3.1 load instructions
	mem[0] = 32'b00000_0010_0000_00000000000_0101_1111; //load r2, r0(95) (puts 4 in r2)
	mem[1] = 32'b00000_0010_0000_00000000000_0010_0110; //load r0, 38(r2) (puts 
	//3.2 store instructions
	mem[2] = 32'b00010_0001_0000_00000000000_01010111; //st 0x87, R1; (see 87 in r1)
	mem[3] = 32'b00010_0001_0001_00000000000_01010111; //st 0x87(R1), R1; (see 0a0a in r1)
	
	/*	3.1 loadi instructions
	mem[2] = 32'b00001_0010_0000_00000000000_0101_1111; //loadi r2, r0(95) (puts 95 in r2)
	mem[3] = 32'b00001_0010_0000_00000000000_0010_0110; //loadi r0, 38(r2) (puts 38+95) in r0*/
	
	/*mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;
	mem[] = ;*/
	
	mem[42] = 32'hffff;
	mem[87] = 32'h0007;
	mem[94] = 32'h0a0a;
	mem[95] = 32'h0004;
	mem[100] = 32'hffff;
	mem[101] = 32'h0003;
	mem[102] = 32'h000a;
	
end

always @ (posedge clock)begin
             		if (write) begin
                                mem[addr] <= BusMuxOut;
                        end
                        else if (read) begin
                                q <= mem[addr];
                        end
	end
	
assign MDataIn = q;
	
endmodule
