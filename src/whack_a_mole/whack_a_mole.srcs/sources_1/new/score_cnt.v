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

module score_cnt(win_or_not, reset, score_display);
  input win_or_not, reset;
  reg [3:0] score;
  wire [3:0] tens;
  wire [3:0] ones;
  wire [3:0] hundreds;
  output reg [15:0] score_display;
  
  binary_to_BCD score_in_BCD(.binary(score), .hundreds(hundreds), .tens(tens), .ones(ones));

  always @ (win_or_not or reset) begin
      if (reset == 1) begin
        score <= 4'b0000; //Start at 0
      end else if (win_or_not == 1) begin
      score <= (score + 1'b1);  //Increment by 1 everytime there is a button press before 1 sec
      end else begin
      score <= score;
      end
    
      score_display = {4'b1010, 4'b1011, tens, ones};
    end
    
endmodule
