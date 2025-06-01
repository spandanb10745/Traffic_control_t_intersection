`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 10:14:09
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
    input [3:0] row,
    input clk,
    input reset,
    output reg sync_row
    );
    reg async_row;
    
    always@(posedge clk or negedge reset)begin
    if(reset)begin
    async_row<=1'b0;
    sync_row<=1'b0;
    end
    else begin
    async_row<=(row[0]||row[1]||row[2]||row[3]);
    sync_row<=async_row;
    end
    end
endmodule
