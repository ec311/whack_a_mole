`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:06:20 PM
// Design Name: 
// Module Name: down_counter
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


module down_counter(
    input clock,
    input reset,
    input [4:0] value,
    output reg [4:0] out
    );
    
    wire slowclock;
    
    clock_divider_Hz c1(.clock (clock), .reset (reset), .slowclock (slowclock));
    
    always @ (posedge slowclock or posedge reset) begin
        if (reset == 1) begin
            out <= value;
        end else begin
            if (out != 5'b00000)
                out <= out - 1;
            else
                out <= value; 
        end
    end  
endmodule
