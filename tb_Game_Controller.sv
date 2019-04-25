`timescale 1ns / 1ps
module tb_Game_Controller;
logic clk, reset;
logic N, S, E, W;
logic s6, s5, s4, s3, s2, s1, s0, sw, dead, win;
gameoutput out(reset, clk, s6, s5, s4, s3, s2, s1, s0, sw);
Game_Controller UUT(
        .clk(clk), 
        .reset(reset),
        .N(N), 
        .S(S), 
        .E(E), 
        .W(W),  
        .s6(s6), 
        .s5(s5), 
        .s4(s4), 
        .s3(s3), 
        .s2(s2), 
        .s1(s1), 
        .s0(s0), 
        .sw(sw),
        .dead(dead),
        .win(win)
        );
    initial 
        forever begin
            clk = 0; #30; clk = 1; #30;
        end
    
    initial begin
        #72 reset = 1; N = 0; E = 0; S = 0; W = 0;
        #60 reset = 0; #60 E = 1;
        #60 E = 0; S = 1;
        #60 S = 0; E = 1;
        #60 E = 0;
        #60 reset = 1;
        #60 reset = 0; #60 E = 1;
        #60 E = 0; S = 1;
        #60 S = 0; W = 1;
        #60 W = 0; E = 1;
        #60 E = 0; N = 1;
        #60 N = 0; W = 1;
        #60 W = 0; E = 1;
        #60 E = 0; S = 1;
        #60 S = 0; E = 1;
        #60 E = 0; 
    end
        
endmodule