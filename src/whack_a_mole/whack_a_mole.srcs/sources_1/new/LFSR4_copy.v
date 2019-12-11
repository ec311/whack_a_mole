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
//reg [2:0] n;
reg [12:0] out;
//wire [2:0] count2;
    
//count2 c1(.clk(clk), .reset(reset), .outCount(count2));

//always @ (posedge clk) begin
//    case (count2)
//        2'b00: begin
//            feedback = ~(out[3] ^ out[2]); 
//            n = 3'b111;
//            end
//        2'b01: begin
//            feedback = ~(out[7] ^ out[3]);
//            n = 3'b110;
//            end
//        2'b10: begin
//            feedback = ~(out[5] ^ out[1]);
//            n = 3'b101;
//            end
//        2'b11: begin
//            feedback = ~(out[5] ^ out[1]);
//            n = 3'b100;
//            end
//    endcase
//end


assign feedback = ~(out[12] ^ out[3] ^ out[2] ^ out[0]);
always @(posedge clk)
  begin
    if (reset)
      out <= 13'b0;
    else
      out <= {out[11:0],feedback};
      number <= out[2:0];
  end


endmodule