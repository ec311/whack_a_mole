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
    input enable,
    input reset,
    output reg [31:0] display,
    output reg done
    );
    
    reg [3:0] countTens;
    reg [3:0] countOnes;
    wire [3:0] countOnes_int;
    reg [3:0] countdownTimer;
    
    
    down_counter countdown_five(.clk(clk_1Hz), .reset(reset), .value(countdownTimer), .counterOut(countOnes_int));
    
    if (1 == 1) begin
        always @ (posedge clk) begin
            if (reset == 1) begin
                countTens <= 4'b0010;
                countdownTimer <= 4'b1001;
                done <= 0;
            end else begin
                if (countTens == 0 && countOnes == 0) begin
                    done <= 1;
                end else begin
                    done <= 0;
                end
                display = {16'b0000110011000000, 8'b00000000, countTens, countOnes};
            end
        end
        
        always @ (countOnes) begin
            if (countOnes == 0) begin
                countTens <= countTens - 1;
            end
        end
        
        assign countOnes_int = countOnes;
        
    end
    
    
//    assign display = {16'b0000110011000000, 8'b00000000, count_tens, count_ones};
//    // pass counter output to display
//    always@(count_ones) begin
//        if (count_tens == 2 || count_tens == 1) begin
//            if (count_ones == 0) begin
//                count_tens <= count_tens - 1'b1;
//            end
//            done_or_not <= 1'b0;
//        end else begin
//            if (count_ones == 0) begin
////                count_tens <= 1'b0; // probably not needed because when count_tens is 0 it will never go back
//                done_or_not <= 1'b1;
//            end else begin
//                done_or_not <= 1'b0;
//            end
//        end
//    end
endmodule

