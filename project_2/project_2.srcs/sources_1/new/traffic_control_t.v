`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 07:39:17
// Design Name: 
// Module Name: traffic_control_t
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


module traffic_control_t(
    input clk,rst,
    output reg [2:0] M1,M2,MT,S
    );
    localparam S0=0,S1=1,S2=2,S3=3,S4=4,S5=5;
    localparam tm7=7,tm5=5,tm2=2,tm3=3;
    reg [3:0] cnt;
    reg[2:0] pres_state;
    
    always@(posedge clk or posedge rst)begin
    if(rst)begin
    pres_state<=S0;
    cnt<=0;
    end
    else begin
    
    case(pres_state)
        S0:if(cnt<tm7)begin
                pres_state<=S0;
                cnt<=cnt+1;
            end
            else begin
                pres_state<=S1;
                cnt<=0;
            end
         S1:if(cnt<tm2)begin
                pres_state<=S1;
                cnt<=cnt+1;
            end
            else begin
                pres_state<=S2;
                cnt<=0;
            end
         S2:if(cnt<tm5)begin
                pres_state<=S2;
                cnt<=cnt+1;
            end
            else begin
                pres_state<=S3;
                cnt<=0;
            end
         S3:if(cnt<tm2)begin
                pres_state<=S3;
                cnt<=cnt+1;
            end
            else begin
                pres_state<=S4;
                cnt<=0;
            end
         S4:if(cnt<tm3)begin
                pres_state<=S4;
                cnt<=cnt+1;
            end
            else begin
                pres_state<=S5;
                cnt<=0;
            end
         S5:if(cnt<tm2)begin
                pres_state<=S5;
                cnt<=cnt+1;
            end
            else begin
                pres_state<=S0;
                cnt<=0;
            end
         default: pres_state<=S0;
     endcase 
    end
    end
    
    
    always@(pres_state)begin
        case(pres_state)
            S0:begin
                M1<=3'b001;
                M2<=3'b001;
                MT<=3'b100;
                S<=3'b100;
            end
            S1:begin
                M1<=3'b001;
                M2<=3'b010;
                MT<=3'b100;
                S<=3'b100;
            end
            S2:begin
                M1<=3'b001;
                M2<=3'b100;
                MT<=3'b001;
                S<=3'b100;
            end
            S3:begin
                M1<=3'b010;
                M2<=3'b100;
                MT<=3'b010;
                S<=3'b100;
            end
            S4:begin
                M1<=3'b100;
                M2<=3'b100;
                MT<=3'b100;
                S<=3'b001;
            end
            S5:begin
                M1<=3'b100;
                M2<=3'b100;
                MT<=3'b100;
                S<=3'b010;
            end
            default:begin
                M1<=3'b000;
                M2<=3'b000;
                MT<=3'b000;
                S<=3'b000;
            end
        endcase
    end
endmodule
