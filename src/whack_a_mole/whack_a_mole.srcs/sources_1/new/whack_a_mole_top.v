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
        input reset,
        output [7:0] ANLine,
        output [6:0] displaySegments
    );
    wire outClk_kHz;
    wire outClk_Hz;
    // Enable bus that chooses which module should be working, basicically state
    wire [3:0] enable;
    wire [3:0] character;
    wire [31:0] display;
    
    // top level clock dividers, pass to each module that uses it
    clock_divider100MHzTo1kHz c_dMTokHz(.clk(clk), .reset(reset), .outClk(outClk_kHz));
    clock_divider100MHzTo1Hz c_dMToHz(.clk(clk), .reset(reset), .outClk(outClk_Hz));
    
    // Input - top level clock, enable signal, reset
    // Output - a 32 bit bus containing everything that will be displayed in binary (display)
    startup s0(.clk(clk), .enable(1), .reset(reset), .display(display));
    
    // Input - 1 KHz clock, reset, a 32 bit bus containing everything that will be displayed in binary (display)
    // Output - 8 bit bus for what segment should be used (ANLine), 4 bit bus containing what character should be used (character)
    display_control d_c(.clk(outClk_kHz), .reset(reset), .display(display), .ANLine(ANLine), .character(character));
    
    // Input - top level clock, reset, 4 bit bus containing what character should be used (character)
    // Output - 8 bit bus containing what segments should be lit up (displaySegments)
    seven_segment_decoder s_7_d(.clk(clk), .reset(reset), .character(character), .displaySegments(displaySegments));
    // inititial countdown module - BEN DONE
    //      7 segment display - BEN DONE
    //          input - a bus containing what to display, output - none
        //      5 second counter (should be the same as 30 second) - BRIANA
    //          input - 5 and down count instruction, output - character encoded in 4 bits for count
    
    // game module
    //      30 second counter (should be the same as 5 second) - BRIANA
    //          input - 30 and up count instruction, output - character encoded in 4 bits for count
    //      score tracker module - MICHELLE
    //          input - score as a bus, output - none
    //          7 segment display (same as before)
    //      randomizer - TERRY
    //          input - either random variable or self generate, output - bus containing state
    //      mole - NORMAN
    //          input - bus containing lights turned on, output - hit or not
endmodule
