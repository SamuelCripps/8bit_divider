`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2024 17:48:07
// Design Name: 
// Module Name: eightbit_divider
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


module eightbit_divider(
    input [7:0] Q,
    input [7:0] M,
    output [7:0] Quo,
    output [7:0] Rem,
    input i_clk
    );
    wire [7:0] Q_debounced, Q_debug, M_debounced, M_debug;
    debouncer deb1(i_clk, Q, Q_debounced,Q_debug);
        debouncer deb2(i_clk, M, M_debounced, M_debug);
     //debouncer(i_clk, i_in, o_debounced, o_debug);
    reg [7:0] Quo = 0;
    reg [7:0] Rem = 0;
    reg [7:0] a1,b1;
    reg [7:0] p1;
    integer i;
    
    always@ (Q_debounced or M_debounced)
    begin
        
        a1 = Q_debounced;
        b1 = M_debounced;
        p1 = 0;
        
        if (a1[7]==1)
        a1 = 0-a1;
        if (b1[7]==1)
        b1 = 0-b1; //here signed decimal is being converted into unsigned ig
        if((b1[7]==1)&&(a1[7]==1))begin
        b1=0-b1;
        a1=0-a1;
        end
        
        for(i=0;i<8;i=i+1)    begin
            p1 = {p1[6:0],a1[7]};
            a1[7:1] = a1[6:0];
            p1 = p1-b1;
            if(p1[7] == 1)  begin
                a1[0] = 0;
                p1 = p1+b1;   end
            else
                a1[0]=1;
    end 
    
    if ((Q_debounced[7]==1)&&(M_debounced[7]==0))
    begin
    Quo = 0-a1;
    Rem = 0-p1;
    end
    
    else if ((Q_debounced[7]==0)&&(M_debounced[7]==1))
    begin
    Quo = 0-a1;
    Rem = p1;
    end
    
    else if ((Q_debounced[7]==1)&&(M_debounced[7]==1))
    begin
    Quo = a1;
    Rem = 0-p1;
    end
    
    else
    begin
    Quo = a1;
    Rem = p1;
    end
   end  

endmodule    
        
                
    
