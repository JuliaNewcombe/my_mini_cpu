module mar (input clear, clock, enable, input [31:0] BusMuxOut, output wire [8:0] addr);
reg [31:0] q;
always @ (posedge clock)
                begin
                        if (clear) begin
                                q <= 0;

                        end
                        else if (enable) begin
                                q <= BusMuxOut;
                        end
                end
        assign addr = q[8:0];
endmodule
