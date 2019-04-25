`timescale 1ns / 1ps
module Game_Controller(
    input logic clk, reset,
    input logic N, S, E, W,
    output logic s6, s5, s4, s3, s2, s1, s0, sw, dead, win
    );
    logic [6:0] LED_out[3:0];
    logic [6:0] LED_out0, LED_out1;
    Room_FSM DUT(
        .clk(clk), 
        .N(N), 
        .S(S), 
        .E(E), 
        .W(W), 
        .reset(reset), 
        .v(v),
        .win(win), 
        .dead(dead), 
        .s6(s6), 
        .s5(s5), 
        .s4(s4), 
        .s3(s3), 
        .s2(s2), 
        .s1(s1), 
        .s0(s0), 
        .sw(sw),
        .LED_out(LED_out1)
        );
    assign LED_out[3] = LED_out1;
    Sword_FSM DUT1(
        .sw(sw), 
        .reset(reset), 
        .clk(clk), 
        .v(v),
        .LED_out(LED_out0)
        );
    assign LED_out[2] = LED_out0;
    always_ff @(posedge clk, posedge reset) 
    begin
        if(reset)
            LED_out <= '{ 7'b0000000, 7'b0000000, 7'b0000000, 7'b0000000 };
        else if(win)
            LED_out <= '{ 7'b1111111, 7'b1111111, 7'b1111111, 7'b1111111 };// all
        else if(dead)
            LED_out <= '{ 7'b0111101, 7'b1001111, 7'b1110111, 7'b0111101 }; //dEAd
    end
    
endmodule
