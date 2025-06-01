`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 10:25:28
// Design Name: 
// Module Name: hex_keyboard
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


module hex_keyboard(
    input [3:0] row,
    input sync_row,
    input clk,
    input reset,
    output reg [3:0] code,
    output valid,
    output reg [3:0] col
    );
    
    reg [5:0] state,next_state;
    
    localparam s0=6'b000001,s1=6'b000010,s2=6'b000100,  //one_hot_encoding
               s3=6'b001000,s4=6'b010000,s5=6'b100000;
      
    assign valid=((state==s1)||(state==s2)||(state==s3)||(state==s4))&&row;
    
    always@(row or col) begin
    case({row,col})
        8'b0001_0001:code=0;
        8'b0001_0010:code=1;
        8'b0001_0100:code=2;
        8'b0001_1000:code=3;
        8'b0010_0001:code=4;
        8'b0010_0010:code=5;
        8'b0010_0100:code=6;
        8'b0010_1000:code=7;
        8'b0100_0001:code=8;
        8'b0100_0010:code=9;
        8'b0100_0100:code=10; //A
        8'b0100_1000:code=11; //B
        8'b1000_0001:code=12; //C
        8'b1000_0010:code=13; //D
        8'b1000_0100:code=14; //E
        8'b1000_1000:code=15; //F
        default:code=0;
    endcase
    end
    
    always@(posedge clk or posedge reset) begin
    if(reset) state<=s0;
    else
    state<=next_state;
    end
    
    always@(state or sync_row or row) begin  //next_state_logic
    next_state=state;
    col=0;
    case(state)
    //assert all columns
    s0:begin col=15;if(sync_row)next_state=s1;end
    //assert column_0
    s1:begin col=1;if(row)next_state=s1;else next_state=s2;end
    //assert column_1
    s2:begin col=2;if(row)next_state=s1;else next_state=s3;end
    //assert column_2
    s3:begin col=4;if(row)next_state=s1;else next_state=s4;end
    //assert column_3
    s4:begin col=8;if(row)next_state=s1;else next_state=s0;end
    //assert all rows
    s5:begin col=15;if(row==0)next_state=s0;end
    endcase
    end
endmodule
