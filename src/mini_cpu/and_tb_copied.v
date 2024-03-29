// and test bench
`timescale 1ns/10ps
module and_tb;
	reg  PCout, Zlowout, MDRout, R2out, R4out;  
	reg  MARin, Zin, PCin, MDRin, IRin, Yin;  
	reg  IncPC, Read, R5in, R2in, R4in; 
	reg [4:0] Operation;
	reg Clock, Clear;
	reg [31:0]  Mdatain;
	reg [31:0]  LO_ALUOut;
	
	parameter Default=4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, Reg_load2b = 4'b0100,
				 Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011,
				 T5 = 4'b1100;
	reg [3:0] Present_state = Default;
	
	Datapath DUT(PCout, Zlowout, MDRout, R2out, R4out, MARin, Zin, PCin, MDRin, IRin, Yin, IncPC, Read,Operation, R5in, R2in, R4in, Mdatain, Clock, Clear);
	
	initial
		begin
			Clock =0;
			forever #10 Clock = ~Clock;
		end
		
	always @(posedge Clock)     //finite state machine; if clock rising-edge
    begin
        case (Present_state)
            Default     :   #45 Present_state = Reg_load1a;
            Reg_load1a  :   #45 Present_state = Reg_load1b;
            Reg_load1b  :   #45 Present_state = Reg_load2a;
            Reg_load2a  :   #45 Present_state = Reg_load2b;
            Reg_load2b  :   #45 Present_state = Reg_load3a;
            Reg_load3a  :   #45 Present_state = Reg_load3b;
            Reg_load3b  :   #45 Present_state = T0;
            T0          :   #45 Present_state = T1;
            T1          :   #45 Present_state = T2;
            T2          :   #45 Present_state = T3;
            T3          :   #45 Present_state = T4;
            T4          :   #45 Present_state = T5;
        endcase
    end
    
always @(Present_state)     // do the required job in each state
    begin
        case (Present_state)              //assert the required signals in each clock cycle
            Default: begin
                PCout <= 0;   Zlowout <= 0;   MDRout<= 0;   //initialize the signals
                R2out <= 0;   R4out <= 0;   MARin <= 0;   Zin <= 0;  
                PCin <=0;   MDRin <= 0;   IRin  <= 0;   Yin <= 0;  
                IncPC <= 0;   Read <= 0;   Operation <= 5'b00000;
                R5in <= 0; R2in <= 0; R4in <= 0; Mdatain <= 32'h00000000;
					 Clear <= 0;
            end
            Reg_load1a: begin
                Mdatain<= 32'h00000022;
                // Read = 0; MDRin = 0;				//the first zero is there for completeness
                #10 Read <= 1; MDRin <= 1;  
            end
            Reg_load1b: begin
                #10 MDRout<= 1; R2in <= 1;  
                #15 MDRout<= 0; R2in <= 0;     // initialize R2 with the value $22
            end
            Reg_load2a: begin 
				Read <= 0; MDRin <= 0;
                #5 Mdatain <= 32'h00000024;
                #10 Read <= 1; MDRin <= 1; 
            end
            Reg_load2b: begin
                #10 MDRout<= 1; R4in <= 1;  
                #15 MDRout<= 0; R4in <= 0;		// initialize R4 with the value $24 
            end
            Reg_load3a: begin 
					 Read <= 0; MDRin <= 0;
                #5 Mdatain <= 32'h00000026;
                #10 Read <= 1; MDRin <= 1;  
            end
            Reg_load3b: begin
                MDRout <= 1; R5in <= 1;  
                #5 MDRout <= 0; R5in <= 0;		// initialize R5 with the value $26 
            end
		T0:begin
			PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;
		end
		T1:begin
			PCout <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
			Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
			Mdatain <= 32'h4A920000; 
		end
		T2:begin
			Zlowout <= 0;
			PCin <= 0; Read <= 0; MDRin <= 0;
			MDRout <= 1; IRin <= 1;  
		end
		T3:begin
			MDRout <= 0;
			 IRin <= 0;  
			R2out <= 1; Yin <= 1; 
		end
		T4:begin
			R2out <= 0; Yin<=0;
			R4out <= 1; Operation <= 5'b01001; Zin <= 1; //opcode
		end
		T5:begin
			R4out <= 0; Zin<=0;
			Zlowout <= 1; R5in <= 1; 
		end
	endcase			
 end				 
endmodule
	