`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 12:57:26 PM
// Design Name: 
// Module Name: clock_divider_Hz
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


module clock_divider_Hz(
    input clock,
    input reset,
    output reg slowclock
    );
    
    reg [31:0] counter;
    parameter constant = 2;//100000000;
    
    always @ (posedge clock or posedge reset) begin
        if (reset == 1) begin
            counter <= 0;
            slowclock <= 0;
        end
        else begin
            if (counter == constant - 1) begin
                counter <= 0;
                slowclock <= ~slowclock;
            end else
                counter <= counter + 1;
        end
    end
endmodule
