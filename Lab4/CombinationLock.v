module CombinationLock(Clock, Reset, X, EnterL, ChangeL, leds);
    input Reset, Clock, ChangeL, EnterL;
	 wire Enter, Change;
    input [3:0] X;
    output reg [0:6] leds;
    reg [1:0] state;
    reg [3:0] Combination;  
    reg [1:0] Attempts;
	 moore inputConditioning1(Clock,ChangeL,Change);
	 moore inputConditioning2(Clock,EnterL,Enter);	 
    parameter Input = 2'b00, Alarm = 2'b01, New = 2'b10, Open = 2'b11;
    
    initial begin
        Combination = 4'b0110;
        Attempts = 1;
        state = Input;
    end

    
    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0) begin
            state <= Input;
            Attempts <= 1;
            Combination <= 4'b0110;
            leds <= 7'b1111110; 
        end else begin
            case (state)
                Input: begin
                    leds = 7'b1111110; 
						  if (Change) begin
							  if(X==Combination) 
								   state <= New;
						  else
							   Attempts <= Attempts-1;
							if(Attempts==0)
								state <= Alarm;
						  end
                    if (Enter) begin
                        if (X == Combination) begin
                            state <= Open;
                        end else begin
                            Attempts <= Attempts - 1;
                            if (Attempts == 0) begin
                                state <= Alarm;
                            end
                        end
                    end
                end

                Alarm: begin
                    leds = 7'b0001000;                    
                end

                New: begin
                    leds = 7'b1101010; 	  
							if (Enter) begin
								Combination <= X;
								state <= Input;
								Attempts <= 1;
							end
                end

                Open: begin
                    leds = 7'b0000001;
                    if (Enter) begin
                        state <= Input;
                        Attempts <= 1;
                    end
                end
            endcase
        end
    end
endmodule
