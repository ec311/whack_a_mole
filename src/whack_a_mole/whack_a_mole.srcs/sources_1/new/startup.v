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
    input enable,
    input reset,
    output reg [31:0] display,
    output reg done
    );
    
    wire [3:0] count;
    reg [3:0] countdownTimer;
    
    down_counter countdown_five(.clk(clk_1Hz), .reset(reset), .value(countdownTimer), .counterOut(count));

    always@(posedge clk) begin
        if (enable == 1) begin
            if (reset == 1) begin
                countdownTimer <= 4'b0101;
                done <= 0;
            end else begin
                if (count == 0) begin
                    done <= 1;
                end else begin
                    done <= 0;
                end
                display <= {16'b0000110011000000, 12'b000000000000, count};
            end
        end else begin
            done <= 0;
        end
    end
endmodule
