`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 04:21:54 PM
// Design Name: 
// Module Name: count2
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


module count2(
    input clk,
    input reset,
    output reg [2:0] outCount
    );
    
    always @(posedge clk, posedge reset) begin
        if (reset)
            outCount <= 3'b000;
        else if (outCount == 3'b111)
            outCount <=  2'b00;
        else 
            outCount <= outCount + 1;
    end
            
endmodule

