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


module mole_state(Clock_1HZ, mole_number, buttons, led, win_or_not
    );
    input Clock_1HZ;
    input [2:0]mole_number;
    input [7:0]buttons;
    output reg [7:0]led;
    output reg win_or_not;
    
    always@(*) begin
        // Inside the 1 second period
        if (Clock_1HZ) begin
            led[mole_number] = 1;
            if (buttons[mole_number] == 1'b1) begin
                win_or_not = 1'b1;
            end
        end
        
        // 1 second period ended
        else begin
            led = 8'b00000000;
            win_or_not = 1'b0;
        end
    end
    
endmodule
