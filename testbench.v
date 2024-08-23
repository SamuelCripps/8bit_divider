`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2024 18:09:54
// Design Name: 
// Module Name: testbench
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


module testbench;

    reg [7:0] Q;
    reg [7:0] M;
    reg i_clk;
    
    
    wire [7:0] Quo;
    wire [7:0] Rem;
    
    eightbit_divider uut(
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
    
        Q=8'd125;
        M=8'd3;
        
        #100;
        
        /*Q=-7;
        M=3;
        
        #100;
        
        Q=7;
        M=-3;
        
        #100;
        
        Q=-7;
        M=-3;
        
        #100;*/
        
    end

    
endmodule
