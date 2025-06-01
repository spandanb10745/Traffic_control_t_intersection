`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 08:12:48
// Design Name: 
// Module Name: traffic_control_tb
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


module traffic_control_tb(

    );
    reg clk,rst;
    wire [2:0] M1,M2,MT,S;
    
    traffic_control_t LUT(clk,rst,M1,M2,MT,S);
    
    initial begin
        clk=1'b0;
        forever #(10/2) clk=~clk;
      end
      
    initial begin
        rst=0;
        #10;
        rst=1;
        #10;
        rst=0;
        #(10*200);
        $finish;
        end
endmodule
