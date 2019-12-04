`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 05:42:47 PM
// Design Name: 
// Module Name: LFSR4
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

module LFSR4 (number, clk, reset);

output reg [2:0] number;
input clk, reset;
wire feedback;
reg [7:0] out;
assign feedback = ~(out[3] ^ out[2]);
always @(posedge clk)
  begin
    if (reset)
      out <= 8'b0;
    else
      out <= {out[6:0],feedback};
      number <= out[2:0];
  end


endmodule