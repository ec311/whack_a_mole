`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 04:04:10 PM
// Design Name: 
// Module Name: mole_state_testbench
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


module mole_state_testbench(
    );

    reg Clock_1HZ;
    reg [2:0]mole_number;
    reg [7:0] buttons;
    
    wire [7:0]led;
    wire win_or_not;
    
    mole_state mole_state_test(.Clock_1HZ(Clock_1HZ), .mole_number(mole_number), .buttons(buttons), .led(led), .win_or_not(win_or_not));
    
    initial begin
        Clock_1HZ = 1'b0;
        mole_number = 3'b001;
        buttons = 7'b0000000;
    end
    
    always begin
        #200
        Clock_1HZ = 1'b1;
        #200
        buttons = 7'b0000010;
        #200
        Clock_1HZ = 1'b0;
    end

endmodule
