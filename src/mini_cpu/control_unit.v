// this is the Verilog sample code for Method 1 for the Control Unit
`timescale 1ns/10ps
module control_unit (
	 output reg [9:0] present_state,
    output reg clear, IncPC, strobe,
	 Gra, Grb, Grc, Rin, Rout, // define the inputs and outputs to your Control Unit here
    PCout, MDRout, Zhighout, Zlowout, HIout, LOout,
    InPortout, Read, Write, Run,
    HIin, LOin, CONin, PCin, IRin, Yin, Zlowin, Zhighin, MARin, MDRin, OutPortIn, Cout, BAout,
    input [31:0] IR,
    input Clock, Reset, Stop, Con_FF);
	 
	 
    parameter reset_state = 10'd0, fetch0 = 10'd1, fetch1 = 10'd2, fetch2 = 10'd3,
    alu3 = 10'd34, alu4 = 10'd35, alu5 = 10'd4, alu6 = 10'd5, alui4 = 10'd6, addr3 = 10'd7, 
    addr4 = 10'd8, ldi5 = 10'd9, ld5 = 10'd10, ld6 = 10'd11, ld7 = 10'd12, ld3 = 10'd13, st6 = 10'd14, br3 = 10'd15,
    br4 = 10'd16, br6 = 10'd17, jr3 = 10'd18, mfhi3 = 10'd19, mflo3 = 10'd20, in3 = 10'd21, out3 = 10'd22, jal3 = 10'd23, 
    jal4 = 10'd24, nop3 = 10'd25, halt3 = 10'd26, alu = 10'd27, alui = 10'd28, store = 10'd29, load = 10'd30, loadi  = 10'd31, 
	 branch = 10'd32, stall = 10'd33, notneg = 10'd36, mul = 10'd37, notneg3 = 10'd38, mul3 = 10'd39, mul4 = 10'd40, mul5 = 10'd41;
    //reg [9:0] present_state = stall; // adjust the bit pattern based on the number of states
initial begin
	present_state = stall;
end
	 
always @(posedge Clock, posedge Reset) // finite state machine; if clock or reset rising-edge
    begin
        if (Reset == 1'b1) present_state = reset_state;
        else case (present_state)
            stall : present_state = stall;
				reset_state: #40 present_state = fetch0;
            fetch0: #40 present_state = fetch1;
            fetch1: #40 present_state = fetch2;
            fetch2: begin
					#30
                case (IR[31:27]) // inst. decoding based on the opcode to set the next state
						  5'b00011, 5'b00100, 5'b00101, 5'b00110, 5'b00111, 5'b01000, 5'b01001, 5'b01010, 5'b01011 : #40 present_state = alu;//add 
                    5'b01100, 5'b01101, 5'b01110 : #40 present_state = alui;//addi
		              5'b10010, 5'b10001 : #40 present_state = notneg; //not and negate
			           5'b01111, 5'b10000 : #40 present_state = mul; //mul and divide
                    5'b00010 : #40 present_state = store; //st
                    5'b00000 : #40 present_state = load;
						  5'b00001 : #40 present_state = loadi; //loadi
                    5'b10011 : #40 present_state = branch;//br
                    5'b10100 : #40 present_state = jr3;//jr
                    5'b10101 : #40 present_state = jal3;//jal
                    5'b10110 : #40 present_state = in3;//in
                    5'b10111 : #40 present_state = out3;//out
                    5'b11000 : #40 present_state = mfhi3;//mfhi
                    5'b11001 : #40 present_state = mflo3;//mflo
                    5'b11010 : #40 present_state = nop3;//nop
                    5'b11011 : #40 present_state = halt3;//halt
                endcase
            end
            // alu stuff
            alu: begin
					 present_state <= alu3;
					 #40 present_state <= alu4;
					 #40 present_state <= alu5;
					 #40 present_state <= fetch0;
            end
            /*alu4: begin
                case(IR[31:27])
                    5'b01111, 5'b10000 : present_state = alu5;
                    default : present_state = alu6;
                endcase
            end
				// alu but for immediates
            alui4: present_state = alu6;
				// for high portion of mul and div
            alu5: present_state = alu6
				// final step of every alu op
            alu6: present_state = fetch0;*/
				
				alui: begin
					 present_state <= alu3;
					 #40 present_state <= alui4;
					 #40 present_state <= alu5;
					 #40 present_state <= fetch0;
				end
				
				notneg : begin
					present_state <= notneg3;
					#40 present_state <= alu5;
					#40 present_state <= fetch0;
				end
				
				mul : begin
					present_state <= alu3;
					#40 present_state <= mul3;
					#40 present_state <= mul4;
					#40 present_state <= mul5;
					#40 present_state <= fetch0;
				end
            
            // branch stuff
            /*br3: present_state = br4;
            br4: present_state = addr4;*/
				branch : begin
					present_state <= br3;
					#40 present_state <= br4;
					#40 present_state <= alui4;
					#40 present_state <= br6;
					#40 present_state <= fetch0;
				end

            //address stuff
            //addr3: present_state = addr4;
				// effective address calculation
            /*addr4: begin // this will be address calculation step could in theory be combined with alui4
                case(IR[31:27])
                    5'b00000 : present_state = ldi5;//ldi
                    5'b00001 : present_state = ld5;//ld
                    5'b00010 : present_state = st5;//st
                    5'b10011 : present_state = br6;//br
                endcase
            end*/
            
            //end of branch stuff (everything after effective address calc)
            //br6: present_state = fetch0;

            //load stuff (everything after effective address calc)
            /*ld5: present_state = ld6;
            ld6: present_state = ld7;
            ld7: present_state = fetch0;
            ldi5: present_state = fetch0;*/
				
				load : begin
					present_state <= ld3;
					#40 present_state <= alui4;
					#40 present_state <= ld5;
					#40 present_state <= ld6;
					#40 present_state <= ld7;
					#40 present_state <= fetch0;
				end
				
				loadi : begin
					present_state <= ld3;
					#40 present_state <= alui4;
					#40 present_state <= alu5;
					#40 present_state <= fetch0;
				end

            //store stuff (everything after effective address calc)
            /*st5: present_state = st6;
            st6: present_state = fetch0;*/
				store : begin
					present_state <= ld3;
					#40 present_state <= alui4;
					#40 present_state <= ld5;
					#40 present_state <= st6;
					#40 present_state <= fetch0;
				end

            //jump stuff
            jr3: #40 present_state <= fetch0;

            jal3: begin
					#40 present_state <= jal4;
					#40 present_state <= fetch0;
				end

            // io stuff
            in3: #40 present_state <= fetch0;

            out3: #40 present_state <= fetch0;

            //mfhi/lo stuff
            mfhi3: #40 present_state = fetch0;

            mflo3: #40 present_state = fetch0;

            //nop3
            nop3: present_state = fetch0;
				
				//default : present_state = fetch0;
				
				halt3 : begin
					Run <= 0;
					//need to figure out a stall type of state. or if we don't need.
				end

        endcase
    end
	 
	 
always @(present_state) 
    begin
        case (present_state) 
            reset_state: begin
					clear <= 1;
					#20 
					clear <= 0;
					{IncPC, strobe, Gra, Grb, Grc, Rin, Rout, PCout, MDRout, Zhighout, Zlowout, HIout, LOout, InPortout, Read, Write, HIin, LOin, CONin, PCin, IRin, Yin, Zlowin, Zhighin, MARin, MDRin, OutPortIn, Cout, BAout} = 29'b0;
            end
            fetch0: begin //see the PC on the bus
					PCout <= 1; MARin <= 1; IncPC <= 1; Zhighin <= 1; Zlowin <= 1;
					#20 
					PCout <= 0; MARin <= 0; IncPC <= 0; Zhighin <= 0; Zlowin <= 0;
            end
            fetch1: begin //see the value of PC plus one on the bus
					Zhighout <= 0; Zlowout <= 1; PCin <= 1;
					#10 Read <= 1; MDRin <= 1;
					#20 Zhighout <= 0; Zlowout <= 0; PCin <= 0;Read <= 0; MDRin <= 0;
            end
            fetch2: begin //read instruction
					MDRout <= 1; Read <= 0; MDRin <= 0; 
					#10 IRin <= 1;
					#20 MDRout <= 0; IRin <= 0;
            end
            alu3: begin //reg to be added in Yin
               Grb <= 1; Rout <= 1; //note that this used to be BAout, not sure why
					#10 Yin <= 1; 
					#20 Grb <= 0; Rout <= 0; Yin <= 0;
            end
            alu4: begin //put rc on the bus and operate ALU
					Grc <= 1; Rout <= 1; Zhighin <= 1; Zlowin <= 1;
					#20 Grc <= 0; Rout <= 0;  Zhighin <= 0; Zlowin <= 0;
            end
            alui4: begin //put C on the bus and operate ALU
					Cout<= 1; Zhighin <= 1; Zlowin <= 1; 
					#20 Cout<= 0; Zhighin <= 0; Zlowin <= 0;
            end
            alu5: begin // see the addition result on the bus, put in gra
					Zlowout <= 1; Gra <= 1; Rin <= 1;
					#20 Zlowout <= 0; Gra <= 0; Rin <= 0;
            end
            br3: begin //see ra on the bus to be evaluated by conff
					Gra <= 1; Rout <= 1; 
					#10 CONin <= 1;
					#20 Gra <= 0; Rout <= 0; CONin <= 0;
            end
            br4: begin //see pc + 1 to Yin
					PCout <= 1; Yin <= 1;
					#20 PCout <= 0; Yin <= 0;
            end
				br6: begin //put Zlow out on bus
					Zlowout <= 1;
					#20 Zlowout <= 0;
				end
				
            /*addr3: begin

            end
            addr4: begin

            end*/
				
				ld3: begin //load register addr in Yin
					Grb <= 1; BAout <= 1; 
					#10 Yin <= 1; 
					#10 Grb <= 0; BAout <= 0; Yin <= 0;
				end
            ld5: begin //Zlowout to Mar
					Zlowout <= 1; MARin <= 1; 
					#10 Zlowout <= 0; MARin <= 0;
            end
            ld6: begin //mdr gets data from ram
					#10
					MDRin <= 1; Read <= 1; 
					#20 MDRin <= 0; Read <= 0;
            end
            ld7: begin //contents of memory to Ra
               Gra <= 1; Rin <= 1; MDRout <= 1; 
					#10 Gra <= 0; Rin <= 0; MDRout <= 0;
            end
				
            st6: begin //ram to bus to ra
					MDRin <= 1; Write <= 1; Rout <= 1; Gra <= 1;
					#10 MDRin <= 0; Write <= 0; Rout <= 0; Gra <= 0;
            end
            
            jr3: begin //write pc with new addr
					Gra <= 1; Rout <= 1; PCin <= 1;
					#20 Gra <= 0; Rout <= 0; PCin <= 0;
            end
				
            jal3: begin //set PC out, data path takes care of link
					#10 PCout <= 1;
					#20 PCout <= 0;
            end

            in3: begin //input data on bus to ra
					strobe <= 1; //strobe should be driven by input
					#5 strobe <= 0; Gra <= 1; Rin <= 1;  InPortout <= 1;
					#20 Gra <= 1; Rin <= 1; InPortout <= 0;
            end
				
            out3: begin //ra on bus to output
               Gra <= 1; Rout <= 1; OutPortIn <= 1;
					#20 Gra <= 0; Rout <= 0; OutPortIn <= 0;
            end
				
            mfhi3: begin 
					HIout <= 1;Gra <= 1; Rin <= 1;  
					#20 Gra <= 0; Rin <= 0; HIout <= 0; 
            end
            mflo3: begin
					LOout <= 1;Gra <= 1; Rin <= 1;  
					#20 Gra <= 0; Rin <= 0; LOout <= 0; 
            end
				
				mul4: begin 
					HIout <= 1; Zhighout <= 1; 
					#20 Zhighout <= 0; HIout <= 0; 
            end
            mul5: begin
					LOin <= 1; Zlowout <= 1;
					#20  LOin <= 0; Zlowout <= 0;
            end
				
				notneg3 : begin
					Rout <= 1; Grb <= 1; Zhighin <= 1; Zlowin <= 1; 
					#20 Rout <= 0; Grb <= 0; Zhighin <= 0; Zlowin <= 0;
				end

            /*nop3: begin

            end
            halt3: begin

            end*/
        endcase
    end
endmodule