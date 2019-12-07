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
    input clk_TenthHz,
    input enable,
    input reset,
    output reg [15:0] display,
    output reg done
    );
    
    wire [4:0] countBinary;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;
    reg [4:0] countdownTimer;
    
    down_counter countdownOnes(.clk(clk_1Hz), .reset(reset), .value(countdownTimer), .counterOut(countBinary));
    binary_to_BCD(.binary(countBinary), .hundreds(hundreds), .tens(tens), .ones(ones));
//    down_counter countdownTens(.clk(clk_TenthHz), .reset(reset), .value(countdownTimerTens), .counterOut(countTens));
    
    if (1 == 1) begin
        always @ (posedge clk) begin
            if (reset == 1) begin
                countdownTimer <= 5'b11110;
                done <= 0;
            end else begin
                  if (countBinary == 0) begin
                    done <= 1;
                  end
                display = {8'b00000000, tens, ones};
            end
        end
    end
endmodule

