`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 09:48:10
// Design Name: 
// Module Name: Signal_Row
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


module Signal_Row(                          //scans for row of asserted key
    input [15:0] key,
    [3:0] col,
    output reg [3:0] row
    );
    
    always@(key or col)begin               //combinational logic for key assertion
    row[0]=key[0]&&col[0] || key[1]&&col[1] || key[2]&&col[2] || key[3]&&col[3];
    row[1]=key[4]&&col[0] || key[5]&&col[1] || key[6]&&col[2] || key[7]&&col[3];
    row[2]=key[8]&&col[0] || key[9]&&col[1] || key[10]&&col[2] || key[11]&&col[3];
    row[3]=key[12]&&col[0] || key[13]&&col[1] || key[14]&&col[2] || key[15]&&col[3];
    end
endmodule
