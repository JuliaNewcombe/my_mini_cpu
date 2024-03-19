module ram (input clock, read, write, input [8:0] addr, input [31:0] BusMuxOut, output wire [31:0] MDataIn);

reg [31:0] mem [511:0];
reg [31:0] 	q;

initial begin
	/*//3.1 load instructions
	mem[0] = 32'b00000_0010_0000_00000000000_0101_1111; //load r2, r0(95) (puts 4 in r2)
	mem[1] = 32'b00000_0000_0010_00000000000_0010_0110; //load r0, 38(r2) (puts 
	//3.2 store instructions
	mem[2] = 32'b00010_0001_0000_00000000000_01010111; //st 0x87, R1; (see 87 in r1)
	mem[3] = 32'b00010_0001_0001_00000000000_01010111; //st 0x87(R1), R1; (see 0a0a in r1)*/
	
	/*	//3.1 loadi instructions
	mem[0] = 32'b00001_0010_0000_00000000000_0101_1111; //loadi r2, r0(95) (puts 95 in r2)
	mem[1] = 32'b00001_0000_0010_00000000000_0010_0110; //loadi r0, 38(r2) (puts 38+95) in r0*/
	
	//3.3 ALU instructions
	mem[0] = 32'b01100_0100_0011_0000000000000000001; //addi r4, r3, 1 (to have something in r4)
	mem[1] = 32'b01100_0011_0100_111111111_1111111011; //addi r3, r4, -5
	mem[2] = 32'b01101_0011_0100_00000000000_00110101; //andi r3, r4, 0x53
	mem[3] = 32'b01110_0011_0100_00000000000_00110101; //ori r3, r4, 0x53
	
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
	mem[43] = 32'd100;
	mem[87] = 32'd43;
	mem[94] = 32'h0a0a;
	mem[95] = 32'h0004;
	mem[100] = 32'hffff;
	mem[101] = 32'h0003;
	mem[102] = 32'h000a;
	mem[130] = 32'habba;
	
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
