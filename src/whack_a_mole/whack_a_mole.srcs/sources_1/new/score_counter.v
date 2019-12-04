`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 3:34:42 PM
// Design Name: 
// Module Name: score_counter
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
module score_counter(win_or_not, reset, score);
  input win_or_not, reset;
  output reg [3:0] score;

  always @ (*) begin
      if (reset) begin
        score <= 4’b0000; //Start at 0
      end

    else if (win_or_not == 1) begin
      score <= (score + 1’b1);  //Increment by 1 everytime there is a button press before 1 sec
    end
  
    else begin
      score <= score;
    end
  end   
endmodule
