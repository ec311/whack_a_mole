`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2019 04:42:41 PM
// Design Name: 
// Module Name: startup1
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


module startup1(
    input clk,
    input clk_1Hz,
    input reset,
    output [31:0] display,
    output reg done_or_not
    );
    
    wire [3:0] count_ones;
    wire [3:0] countdownTimer = 4'b1001;
    reg [3:0] count_tens = 4'b0010;
    
    down_counter countdown_five(.clk(clk_1Hz), .reset(reset), .value(countdownTimer), .counterOut(count_ones));
    
    assign display = {16'b0000110011000000, 8'b00000000, count_tens, count_ones};
    // pass counter output to display
    always@(count_ones) begin
        if (count_tens == 2 || count_tens == 1) begin
            if (count_ones == 0) begin
                count_tens = count_tens - 1'b1;
            end
            done_or_not <= 1'b0;
        end else begin
            if (count_ones == 0) begin
                count_tens = 1'b0;
                done_or_not <= 1'b1;
            end else begin
                done_or_not <= 1'b0;
            end
        end
    end
endmodule

