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

module LFSR4 (
    input clk,
    input reset,
    output reg [2:0] number
    );
    
    wire feedback;
    reg [7:0] out;
    
    //  TERRY - COMMENT WHAT THIS ACTUALLY DOES
    assign feedback = ~(out[3] ^ out[2]);
    always @(posedge clk) begin
        if (reset == 1)
          out <= 0;
        else
          out <= {out[6:0], feedback};
          number <= out[2:0];
      end
      
endmodule