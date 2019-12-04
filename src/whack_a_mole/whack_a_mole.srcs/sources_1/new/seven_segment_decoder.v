`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 12:45:59 PM
// Design Name: 
// Module Name: seven_segment_decoder
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

// Input - a single character encoded in 4 bits to be converted to seven segments
// Output - seven segments encoded that shows the character
module seven_segment_decoder(
    input [3:0] character,
    input reset,
    input clk,
    output reg [6:0] displaySegments
    );
    
    always @(posedge reset, posedge clk) begin
        if (reset)
            displaySegments <= 7'b1111111;
        else begin
            case(character)
            
                4'b0000 : displaySegments <= 7'b0000001; // 0
                4'b0001 : displaySegments <= 7'b1001111; // 1
                4'b0010 : displaySegments <= 7'b0010010; // 2
                4'b0011 : displaySegments <= 7'b0000110; // 3
                
                4'b0100 : displaySegments <= 7'b1001100; // 4
                4'b0101 : displaySegments <= 7'b0100100; // 5
                4'b0110 : displaySegments <= 7'b0100000; // 6
                4'b0111 : displaySegments <= 7'b0001111; // 7
                
                4'b1000 : displaySegments <= 7'b0000000; // 8
                4'b1001 : displaySegments <= 7'b0001100; // 9
                4'b1010 : displaySegments <= 7'b0011000; // P
                4'b1011 : displaySegments <= 7'b1110000; // t
                
                4'b1100 : displaySegments <= 7'b1111111;
                4'b1101 : displaySegments <= 7'b1111111;
                4'b1110 : displaySegments <= 7'b1111111;
                4'b1111 : displaySegments <= 7'b1111111;
                default : displaySegments <= 7'b1111111;
                
            endcase
         end
     end 
endmodule
