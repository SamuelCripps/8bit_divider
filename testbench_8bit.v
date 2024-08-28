`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2024 13:20:35
// Design Name: 
// Module Name: testbench_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_8bit;

    reg [7:0] Q;
    reg [7:0] M;
    reg i_clk;
    
    
    wire [7:0] Quo;
    wire [7:0] Rem;
    
    divider_8bit uut(
        .Q(Q),
        .M(M),
        .Quo(Quo),
        .Rem(Rem),
        .i_clk(i_clk)
    );
    initial
        begin
            i_clk=0;
            forever #1 i_clk=~i_clk;
        end
    
    initial begin
    
        Q=8'd7;
        M=8'd3;
        
        #100;
        
        Q=-7;
        M=3;
        
        #100;
        
        Q=7;
        M=-3;
        
        #100;
        
        Q=-7;
        M=-3;
        
        #100;
        
    end

    
endmodule
