/ this is the Verilog sample code for Method 1 for the Control Unit
`timescale 1ns/10ps
module control_unit (
    output reg Gra, Grb, Grc, Rin, Rout, // define the inputs and outputs to your Control Unit here
    PCout, MDRout, Zhighout, Zlowout, HIout, LOout,
    In.Portout, Read, Write, Run, Clear,
    HIin, LOin, CONin, PCin, IRin, Yin, Zin, MARin, MDRin, OUT.Portin, Cout, BAout,
    AND, OR, NEG, NOT, SHR, SHRA, SHL, ROR, ROL, ADD, SUB, MUL, DIV, 
    input [31:0] IR,
    input Clock, Reset, Stop, …, Con_FF);
    parameter reset_state = 5'b00000, fetch0 = 5'b00001, fetch1 = 5'b00010, fetch2 = 5'b00011,
    alu3 = 5'b00100, alu4 = 5'b00101, alu5 = 5'b00110, alu6 = 5b'00111, alui4 = 5'b01000, addr3 = 5'b01001, 
    addr4 = 5'b01010; ldi5 = 5'b01011, ld5 = 5'b01100, ld6 = 5'b01101, ld7 = 5'b01110, st5 = 5'b01111, st6 = 5'b10000, br3 = 5'b10001,
    br4 = 5'b10010, br6 = 5'b10011, jr3 = 5'b10111, mfhi3 = 5'b11000, mflo3 = 5'b11001, in3 = 5'b11010, out3 = 5'b11011, jal3 = 5'b11100, 
    jal4 = 5'b11101, nop3 = 5'b11110, halt3 = 5'b11111;
    reg [3:0] present_state = reset_state; // adjust the bit pattern based on the number of states
always @(posedge Clock, posedge Reset) // finite state machine; if clock or reset rising-edge
    begin
        if (Reset == 1'b1) present_state = reset_state;
        else case (present_state)
        /*
        Important things to note
            - addr4 just preforms effective address calculation and as such is reused for all operations that require it
            - alu ops are almost all the same except for immediate and mul/div which have one step added or diff
        */
            reset_state: present_state = fetch0;
            fetch0: present_state = fetch1;
            fetch1: present_state = fetch2;
            fetch2: begin
                case (IR[31:27]) // inst. decoding based on the opcode to set the next state
                	/*5'b00011 : alu3;//add 
                    5'b01100 : alui3//addi
			        5'b00100 : alu3//sub
			        5'b01010 : alu3//and 
                    5'b01101 : alui3//andi
			        5'b01011 : alu3//or 
                    5'b01110 : alui3//ori
			        5'b00111 : alu3//shl
			        5'b00101 : alu3//shr
			        5'b00110 : alu3//shra
			        5'b01001 : alu3//rol
			        5'b01000 : alu3//ror
		            5'b10010 : alu3//not
			        5'b10001 : alu3//negate
			        5'b01111 : alu3//mul
			        5'b10000 : alu3//divide*/
                    5'b01100, 5'b0110, 5'b01110, 5'b00011, 5'b00100, 5'b01010, 5'b01011, 5'b00111, 5'b00101, 
                    5'b00110, 5'b01001, 5'b01000, 5'b10010, 5'b10001, 5'b01111, 5'b10000 : alu3;
                    /*5'b00000 : //ld
                    5'b00001 : //ldi
                    5'b00010 : //st*/
                    5'b00000, 5'b00001, 5'b00010: addr3;
                    5'b10011 : br3;//br
                    5'b10100 : jr3;//jr
                    5'b10101 : jal3;//jal
                    5'b10110 : in3;//in
                    5'b10111 : out3;//out
                    5'b11000 : mfhi3;//mfhi
                    5'b11001 : mflo3;//mflo
                    5'b11010 : nop3;//nop
                    5'b11011 : halt3;//halt
                endcase
            end
            // alu stuff
            alu3: begin
                case(IR[31:27])
                    5'b01100, 5'b0110, 5'b01110 : alui4;
                    default : alu4
                endcase
            end
            alu4: begin
                case(IR[31:27])
                    5'b01111, 5'b10000 : present_state = alu5;
                    default : present_state = alu6;
                endcase
            end
            alui4: present_state = alu6;
            alu5: present_state = alu6
            alu6: present_state = fetch0;
            
            // branch stuff
            br3: present_state = br4;
            br4: present_state = addr4;

            //address stuff
            addr3: present_state = addr4;
            addr4: begin // this will be address calculation step could in theory be combined with alui4
                case(IR[31:27])
                    5'b00000 : present_state = ldi5;//ldi
                    5'b00001 : present_state = ld5;//ld
                    5'b00010 : present_state = st5;//st
                    5'b10011 : present_state = br6;//br
                endcase
            end
            
            //end of branch stuff
            br6: present_state = fetch0;

            //load stuff
            ld5: present_state = ld6;
            ld6: present_state = ld7;
            ld7: present_state = fetch0;

            ldi5: present_state = fetch0;

            //store stuff
            st5: present_state = st6;
            st6: present_state = fetch0;

            //jump stuff
            jr3: present_state = fetch0;

            jal3: present_state = jal4;
            jal4: present_state = fetch0;

            // io stuff
            in3: present_state = fetch0;

            out3: present_state = fetch0;

            //mfhi/lo stuff
            mfhi3: present_state = fetch0;

            mflo3: present_state = fetch0;

            //nop3
            nop3: present_state = fetch0;

        endcase
    end
always @(present_state) // do the job for each state
    begin
	 // Need to add control signals here
        case (present_state) // assert the required signals in each state
            reset_state: begin
                Gra <= 0; Grb <= 0; Grc <= 0; Yin <= 0; // initialize the signals
                ⁞
            end
            fetch0: begin
                PCout <= 1; // see if you need to de-assert these signals
                MARin <= 1;
                IncPC <= 1;
                Zin <= 1;
            end
            fetch1: begin

            end
            fetch2: begin

            end
            alu3: begin
                Grb <= 1; Rout <= 1;
                Yin <= 1;
            end
            alu4: begin
            
            end
            alui4: begin

            end
            alu5: begin

            end
            alu6: begin

            end
            br3: begin

            end
            br4: begin

            end
            addr3: begin

            end
            addr4: begin

            end
            br6: begin

            end
            ld5: begin

            end
            ld6: begin

            end
            ld7: begin
                
            end
            ldi5: begin

            end
            st5: begin

            end
            st6: begin

            end
            jr3: begin

            end
            jal3: begin

            end
            jal4: begin

            end
            in3: begin

            end
            out3: begin
                
            end
            mfhi3: begin 

            end
            mflo3: begin

            end
            nop3: begin

            end
            halt3: begin

            end
        endcase
    end
endmodule