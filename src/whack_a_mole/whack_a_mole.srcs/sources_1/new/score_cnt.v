`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 04:18:04 PM
// Design Name: 
// Module Name: score_cnt
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

module score_cnt(
    input clk,
    input win, 
    input reset, 
    output reg [15:0] score_display
    );

    reg [3:0] scoreBinary;
    wire [3:0] tens;
    wire [3:0] ones;
    wire [3:0] hundreds;
  
    binary_to_BCD score_in_BCD(.binary(scoreBinary), .hundreds(hundreds), .tens(tens), .ones(ones));
    
    always @(posedge clk) begin
        if (reset) begin
            scoreBinary = 0;
        end else if (win == 1) begin
            scoreBinary = scoreBinary + 1;
        end
        score_display = {tens, ones, 4'b1010, 4'b1011};
    end
        

//  always @ (win_or_not or reset) begin
//      if (reset == 1) begin
//        score <= 4'b0000; //Start at 0
//      end else if (win_or_not == 1) begin
//        score <= score + 1'b1;  //Increment by 1 everytime there is a button press before 1 sec
//      end else begin
//        score <= score;
//      end
    
//      score_display = {4'b1010, 4'b1011, tens, ones};
//    end
    
endmodule
