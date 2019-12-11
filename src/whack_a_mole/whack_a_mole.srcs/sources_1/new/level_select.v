`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2019 11:28:20 PM
// Design Name: 
// Module Name: level_select
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


module level_select(
    input easy,
    input med,
    input hard,
    output reg [1:0] level
    );
    
    always @ (*) begin
        if (easy == 1 && med == 0 && hard == 0)
            level = 2'b00;
            //value <= 26'b10111110101111000010000000; //easy: 1Hz
        else if (easy == 0 && med == 1 && hard == 0)
            level = 2'b01;
            //value <= 26'b01011111010111100001000000; //hard: 2 Hz
        else if (easy == 0 && med == 0 && hard == 1)
            level = 2'b10;
            //value <= value <= 26'b10111110101111000010000000; //default to 1Hz
        else if (easy == 1 && med == 1 && hard == 1)
            level = 2'b10; // go to hard
            //value <= 26'b01011111010111100001000000; //go to hard
        else if (easy == 0 && med == 0 && hard == 0)
            level = 2'b01; // go to medium
        else
            level = 2'b01; // go to medium
    end
endmodule
