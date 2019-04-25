`timescale 1ns / 1ps

module Room_FSM(
        input logic clk, N, S, E, W, reset, v,
        output logic win, dead, s6, s5, s4, s3, s2, s1, s0, sw,
        output logic [6:0] LED_out
);
logic sword = 0;
enum{   
    Cave_of_Cacophany = 32'b000000000000000000000000000000001, Twisty_Tunnel = 32'b000000000000000000000000000000010,
    Secret_Sword_Stash = 32'b000000000000000000000000000000100, Rapid_River =  32'b000000000000000000000000000001000,
    Dragons_Den = 32'b000000000000000000000000000010000, Victory_Vault = 32'b000000000000000000000000000100000,
    Grievous_Graveyard = 32'b000000000000000000000000001000000
    } state, nextstate;

always_ff @(posedge clk, posedge reset)
begin
     if(reset) begin
        state <= Cave_of_Cacophany;
        sw <= 0;
    end
    else begin 
        state <= nextstate;
        sw <= sword;
    end
end

always_comb
begin
    nextstate = Cave_of_Cacophany;
    case(state)
        Cave_of_Cacophany:
            if(E)
                nextstate = Twisty_Tunnel;
            else
                nextstate = state;
              
        Twisty_Tunnel:
            if(S) 
                nextstate = Rapid_River;
            else if(W) 
                nextstate = Cave_of_Cacophany;
            else
                nextstate = state;
                
        Rapid_River:
            if(W) begin
                nextstate = Secret_Sword_Stash;
                sword = 1;
            end
            else if(N) begin
                nextstate = Twisty_Tunnel;
            end
            else if(E) 
                nextstate = Dragons_Den;
            else
                nextstate = state;
                
        Secret_Sword_Stash:
            if(E) begin
                nextstate = Rapid_River;
            end
            else
                nextstate = state;
    
        Dragons_Den:
            if(v) begin
                nextstate = Victory_Vault;
            end
            else if(~v) begin
                nextstate = Grievous_Graveyard;
            end
    
        default:
            nextstate = state;  
    endcase
end      
assign s0 = (state == Cave_of_Cacophany)?1'b1:1'b0;
assign s1 = (state == Twisty_Tunnel)?1'b1:1'b0;
assign s2 = (state == Rapid_River)?1'b1:1'b0;
assign s3 = (state == Secret_Sword_Stash)?1'b1:1'b0;
assign s4 = (state == Dragons_Den)?1'b1:1'b0;
assign s5 = (state == Victory_Vault)?1'b1:1'b0;
assign s6 = (state == Grievous_Graveyard)?1'b1:1'b0;

assign win = (s5 == 1)? 1'b1:1'b0;    
assign dead = (s6 == 1)? 1'b1:1'b0;    
always_comb
begin
    LED_out = 7'b0000000;
    case(state)
        Cave_of_Cacophany:      
            LED_out = 7'b1001110; //C
        Twisty_Tunnel:    
            LED_out = 7'b1000110; //T 
        Rapid_River:     
            LED_out = 7'b1110111; //A  
        Secret_Sword_Stash:     
            LED_out = 7'b1011011; //S  
        Dragons_Den:       
            LED_out = 7'b0111101; //d   
        Victory_Vault:     
            LED_out = 7'b0111110; //V
        Grievous_Graveyard:     
            LED_out = 7'b1011111; //G 
    endcase
end

endmodule
