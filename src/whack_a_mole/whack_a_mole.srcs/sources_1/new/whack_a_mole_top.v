`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 02:59:14 PM
// Design Name: 
// Module Name: whack_a_mole_top
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


module whack_a_mole_top(
        input clk,
        input reset
    );
    
    // inititial countdown module
    //      7 segment display - BEN
    //          input - a bus containing what to display, output - none
        //      5 second counter (should be the same as 30 second) - BRIANA
    //          input - 5 and down count instruction, output - 1 for done
    
    // game module
    //      30 second counter (should be the same as 5 second) - BRIANA
    //          input - 30 and up count instruction, output - 1 for done
    //      score tracker module - MICHELLE
    //          input - score as a bus, output - none
    //          7 segment display (same as before)
    //      randomizer - TERRY
    //          input - either random variable or self generate, output - bus containing state
    //      mole - NORMAN
    //          input - bus containing lights turned on, output - hit or not
endmodule
