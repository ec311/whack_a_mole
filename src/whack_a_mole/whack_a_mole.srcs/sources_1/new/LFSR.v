`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:34:26 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input [0:2] input_num,
    input clock,
    input reset,
    output reg [0:2] number
     );
    
    reg [0:2] temp;
    always @ (posedge clock) begin
        if(reset) begin
            number <= input_num;
        end 
        else begin
            number <= {number[2],(number[0]^number[2]),number[1]};
        end
    end
    
endmodule
