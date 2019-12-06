`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:16:14 PM
// Design Name: 
// Module Name: startup
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


module startup(
    input clk,
    input clk_1Hz,
    input reset,
    input enable,
    output reg [31:0] display,
    output reg done_or_not
    );
    
    wire [3:0] count;
    wire [3:0] countdownTimer = 4'b0101;
    
    down_counter countdown_five(.clk(clk_1Hz), .reset(reset), .value(countdownTimer), .counterOut(count));
    
    // pass counter output to display
    always@(posedge clk, posedge reset) begin
        if (enable) begin
            if (reset) begin
                display = 0;
                done_or_not = 0;
            end else begin
                if (count == 0) begin
                    done_or_not <= 1'b1;
                end else begin
                    done_or_not <= 1'b0;
                end
                display = {16'b0000110011000000, 12'b000000000000, count};
            end
        end

    end
endmodule
