`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 11:02:21
// Design Name: 
// Module Name: testbench_hex_keyboard
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


module testbench_hex_keyboard(

    );
    wire [3:0] code;
    wire valid;
    wire [3:0] col;
    wire [3:0] row;
    reg  clk,reset;
    reg [15:0]key;
    reg [39:0] pressed;
    parameter [39:0] key_0="Key_0";
    parameter [39:0] key_1="Key_1";
    parameter [39:0] key_2="Key_2";
    parameter [39:0] key_3="Key_3";
    parameter [39:0] key_4="Key_4";
    parameter [39:0] key_5="Key_5";
    parameter [39:0] key_6="Key_6";
    parameter [39:0] key_7="Key_7";
    parameter [39:0] key_8="Key_8";
    parameter [39:0] key_9="Key_9";
    parameter [39:0] key_A="Key_A";
    parameter [39:0] key_B="Key_B";
    parameter [39:0] key_C="Key_C";
    parameter [39:0] key_D="Key_D";
    parameter [39:0] key_E="Key_E";
    parameter [39:0] key_F="Key_F";
    parameter [39:0] None="None";
    
    integer j,k;
    
    always@(key)begin
    case(key)
    16'h0000:pressed=None;
    16'h0001:pressed=key_0;
    16'h0002:pressed=key_1;
    16'h0004:pressed=key_2;
    16'h0008:pressed=key_3;
    16'h0010:pressed=key_4;
    16'h0020:pressed=key_5;
    16'h0040:pressed=key_6;
    16'h0080:pressed=key_7;
    16'h0100:pressed=key_8;
    16'h0200:pressed=key_9;
    16'h0400:pressed=key_A;
    16'h0800:pressed=key_B;
    16'h1000:pressed=key_C;
    16'h2000:pressed=key_D;
    16'h4000:pressed=key_E;
    16'h8000:pressed=key_F;
    endcase
    end
     
    hex_keyboard Mac1(row,sync_row,clk,reset,code,valid,col);
    Signal_Row Mac2(key,col,row);
    synchronizer Mac3(row,clk,reset,sync_row);
    
    initial #2000 $finish;
    initial begin clk=0;forever #5 clk=~clk;end
    initial begin reset=1;#10 reset=0;end
    
    initial
    begin
    for(k=0;k<=1;k=k+1)
    begin
    key=0;
    #20
    for(j=0;j<=16;j=j+1)
    begin
    #20 key[j]=1;
    #60 key=0;
    end
    end
    end  
endmodule
