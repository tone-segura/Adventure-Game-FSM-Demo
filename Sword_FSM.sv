`timescale 1ns / 1ps

module Sword_FSM(
    input logic sw, reset, clk,
    output logic v,
    output logic [6:0] LED_out
    );
    logic nextstate;
    
    always_ff@(posedge clk, posedge reset)
    begin
        if(reset) 
            v <= 0;
        else v <= nextstate;
    end
    
    always_comb
    begin
        case(sw)
            0: nextstate = 0;
            1: nextstate = 1;
        endcase
    end
    
    always_comb
    begin
        case(v)
            0: LED_out = 7'b0000001;
            1: LED_out = 7'b1011011;
        endcase
    end  
endmodule
