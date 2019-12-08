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
    input enable,
    input reset,
    input clk,
    input clk_1Hz,
    input [2:0] mole_number,
    input [7:0] switches,
    output reg win
    );
    
    reg [7:0] switches_delay;
    reg switchHit;
    
    always @(posedge clk) begin
        switches_delay <= switches;
        if (switchHit == 1) begin
            win <= 1;
        end else 
            win <= 0;
    end
    
    always @(posedge clk) begin
        case(mole_number)
            3'b000: switchHit = (switches[0] == 0 && switches_delay[0] == 1) ? 1 : 0;
            3'b001: switchHit = (switches[1] == 0 && switches_delay[1] == 1) ? 1 : 0;
            3'b010: switchHit = (switches[2] == 0 && switches_delay[2] == 1) ? 1 : 0;
            3'b011: switchHit = (switches[3] == 0 && switches_delay[3] == 1) ? 1 : 0;
            3'b100: switchHit = (switches[4] == 0 && switches_delay[4] == 1) ? 1 : 0;
            3'b101: switchHit = (switches[5] == 0 && switches_delay[5] == 1) ? 1 : 0;
            3'b110: switchHit = (switches[6] == 0 && switches_delay[6] == 1) ? 1 : 0;
            3'b111: switchHit = (switches[7] == 0 && switches_delay[7] == 1) ? 1 : 0;
        endcase
    end
endmodule
    
//    always @(posedge clk, posedge reset) begin
//        if (reset == 1) begin
//            win <= 0;
//            switchHit <= 0;
//        end else begin
//            if (switchHit == 1) begin
//                win <= 1;
////                switchHit <= 0;
//            end else begin
//                win <= 0;
//            end
//        end
//    end
    
//    always @(*) begin
//        case(mole_number)
//            3'b000: switchHit = (switches[0] == 1) ? 1 : 0;
//            3'b001: switchHit = (switches[1] == 1) ? 1 : 0;
//            3'b010: switchHit = (switches[2] == 1) ? 1 : 0;
//            3'b011: switchHit = (switches[3] == 1) ? 1 : 0;
//            3'b100: switchHit = (switches[4] == 1) ? 1 : 0;
//            3'b101: switchHit = (switches[5] == 1) ? 1 : 0;
//            3'b110: switchHit = (switches[6] == 1) ? 1 : 0;
//            3'b111: switchHit = (switches[7] == 1) ? 1 : 0;
//        endcase
//    end
//endmodule
                
    

