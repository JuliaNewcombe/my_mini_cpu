module ram (input clock, read, write, input [8:0] addr, input [31:0] BusMuxOut, output wire [31:0] MDataIn);

reg [31:0] mem [511:0];
reg [31:0] 	q;

initial begin
	/*//3.1 load instructions
	mem[0] = 32'b00000_0010_0000_00000000000_1001_1001; //load r2, r0(0x95) (puts 4 in r2)
	mem[1] = 32'b00000_0000_0010_00000000000_0011_1000; //load r0, 38(r2) 
	
	//3.2 store instructions
	mem[0] = 32'b01100_0001_0001_0000000000000000001; //addi r1, r1, 1 (to have something in r4)
	mem[1] = 32'b00010_0001_0000_00000000000_10000111; //st 0x87, R1; (see 87 in r1)
	mem[2] = 32'b00010_0001_0001_00000000000_10000111; //st 0x87(R1), R1; 
	
		//3.1 loadi instructions
	mem[0] = 32'b00001_0010_0000_00000000000_10010101; //loadi r2, r0(95) (puts 95 in r2)
	mem[1] = 32'b00001_0000_0010_00000000000_00111000; //loadi r0, 38(r2) (puts 38+95) in r0*/
	
	//3.3 ALU instructions
	mem[0] = 32'b01100_0100_0011_0000000000000000001; //addi r4, r3, 1 (to have something in r4)
	mem[1] = 32'b01100_0011_0100_111111111_1111111011; //addi r3, r4, -5
	mem[2] = 32'b01101_0011_0100_00000000000_01010011; //andi r3, r4, 0x53
	mem[3] = 32'b01110_0011_0100_00000000000_01010011; //ori r3, r4, 0x53
	
	/*//3.7 in out instructions
	mem[0] = 32'b01100_0011_0011_0000000000000000001; //addi r3, r3, 1 (to have something in r4)
	mem[1] = 32'b10111_0011_0000000000_0000000000_000; //out r3
	mem[2] = 32'b10110_0100_0000000000_0000000000_000; //in r4
	
	//3.5 jump instructions
	mem[0] = 32'b01100_0110_0110_0000000000000000101; //addi r6, r6, 5 (to have something in r4)
	mem[1] = 32'b10100_0110_000_0000000000_0000000000;//jr r6
	mem[5] = 32'b01100_0110_0000_0000000000000000000; //addi r6, r0, 0
	mem[6] = 32'b10101_0110_000_0000000000_0000000000; //jal r6
	
	//3.6 mfhi mflo instructions
	mem[0] = 32'b01100_0011_0110_0000000000000000101; //addi r6, r6, 5 (to have something in r6)
	mem[1] = 32'b11000_0110_000_0000000000_0000000000;//mfhi r6
	mem[2] = 32'b01100_0011_0000_0000000000000110101; //addi r6, r0, 53 (to have something different in r6
	mem[3] = 32'b11001_0111_000_0000000000_0000000000; //mflo r7
	
	//3.4 branch 
	mem[0]  = 32'b10011_0101_0000_000000000000000_1110;//brzr r5 14
	mem[15] = 32'b10011_0101_0001_000000000000000_1110;//brnz r5 14
	mem[16] = 32'b01100_0101_0101_111111111_1111111011;//addi r5, r5, -5
	mem[17] = 32'b10011_0101_0010_000000000000000_1110;//brpl r5 14
	mem[18] = 32'b10011_0101_0011_000000000000000_1110;//brmi r5 14
	
	
	mem[42] = 32'hffff;
	mem[43] = 32'd100;
	mem[87] = 32'd43;
	mem[94] = 32'h0a0a;
	mem[95] = 32'h0004;
	mem[100] = 32'hffff;
	mem[101] = 32'h0003;
	mem[102] = 32'h000a;
	mem[153] = 32'h4;
	mem[60] = 32'habba;*/
	
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
