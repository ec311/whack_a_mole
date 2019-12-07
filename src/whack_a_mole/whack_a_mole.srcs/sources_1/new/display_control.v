`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:35:18 PM
// Design Name: 
// Module Name: display_control
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


module display_control(
    input clk,
    input reset,
    input [31:0] display,
    output reg [7:0] ANLine,
    output reg [3:0] character
    );
    
    wire [2:0] count2;
    
    count2 c1(.clk(clk), .reset(reset), .outCount(count2));
    
    always @(posedge clk) begin
        if (reset) begin
            ANLine <= 8'b11111110;
            character <= 4'b0000;
        end else begin
            if (count2 == 3'b000) begin
                ANLine <= 8'b11111110;
                character <= display[3:0];
            end else if (count2 == 3'b001) begin
                ANLine <= 8'b11111101; 
                character <= display[7:4];
            end else if (count2 == 3'b010) begin
                ANLine <= 8'b11111011; 
                character <= display[11:8];
            end else if (count2 == 3'b011) begin
                ANLine <= 8'b11110111; 
                character <= display[15:12];
            end else if (count2 == 3'b100) begin
                ANLine <= 8'b11101111; 
                character <= display[19:16];
            end else if (count2 == 3'b101) begin
                ANLine <= 8'b11011111; 
                character <= display[23:20];
            end else if (count2 == 3'b110) begin
                ANLine <= 8'b10111111; 
                character <= display[27:24];
            end else if (count2 == 3'b111) begin
                ANLine <= 8'b01111111; 
                character <= display[31:28];
            end
        end
    end
endmodule
