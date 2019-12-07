`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 12:50:42 PM
// Design Name: 
// Module Name: mole_state
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


module check_mole_hit(
    input clk,
    input clk_1Hz,
    input [2:0] mole_number,
    input [7:0] switches,
    output win
    );
//    input clk_1Hz;
//    input [2:0]mole_number;
//    input [7:0]buttons;
//    output reg [4:0] led;//[7:0]led;
//    output reg win_or_not;
//    always @(posedge clk) begin
     
//    end
//    always@(*) begin
//        // Inside the 1 second period
//        if (clk_1Hz) begin
//            led[mole_number] = 1;
//            if (buttons[mole_number] == 1'b1) begin
//                win_or_not = 1'b1;
//            end
//        end
        
//        // 1 second period ended
//        else begin
//            led = 8'b00000000;
//            win_or_not = 1'b0;
//        end
//    end
    
endmodule
