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
    // 1Hz
    input clk,
    input reset,
    input [4:0] value,
    output reg [4:0] counterOut
    );
    
    always @ (posedge clk or posedge reset) begin
        if (reset == 1) begin
            counterOut <= value;
        end else begin
            if (counterOut != 4'b0000)
                counterOut <= counterOut - 1;
            else
                counterOut <= value; 
        end
    end  
endmodule
