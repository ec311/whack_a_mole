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
        output [6:0] displaySegments,
        output [7:0] leds
    );
    wire outClk_kHz;
    wire outClk_Hz;
    wire outClk_TenthHz;
    reg [3:0] state;
    reg [3:0] nextState;
    wire [3:0] character;
    reg [31:0] display;
    wire [31:0] display_s0;
    wire [15:0] display_s1;
    wire [15:0] score_display;
    
    reg [3:0] enable;
    reg [3:0] nextEnable;

    wire [2:0] random_num;
    wire [2:0] mole_num;
    wire [7:0] buttons;
    wire done_0;
    wire done_1;
    wire win_or_not;
    
    // top level clock dividers, pass to each module that uses it
    clock_divider100MHzTo1kHz c_dMTokHz(.clk(clk), .reset(reset), .outClk(outClk_kHz));
    clock_divider100MHzTo1Hz c_dMToHz(.clk(clk), .reset(reset), .outClk(outClk_Hz));
    clock_divider100MHzToTenthHz c_dMToTenthHz(.clk(clk), .reset(reset), .outClk(outClk_TenthHz));
    
    // Input - top level clock, 1Hz clock, enable signal, reset
    // Output - a 32 bit bus containing everything that will be displayed in binary (display)
    startup s0(.clk(clk), .clk_1Hz(outClk_Hz), .enable(enable[0]), .reset(reset), .display(display_s0), .done(done_0));
    startup1 s1(.clk(clk), .clk_1Hz(outClk_Hz), .clk_TenthHz(outClk_TenthHz), .enable(enable[1]), .reset(done_0), .display(display_s1), .done(done_1));

    
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
    
    
    score_cnt score_counter(.win_or_not(1'b0), .reset(reset), .score_display(score_display));
    
    // 
    LFSR4 my_randomizer(.clk(outClk_Hz), .reset(reset), .number(random_num));
    
    led_select l1(.enable(enable[1]), .reset(reset), .random_num(random_num), .leds(leds), .mole_num(mole_num));
    
//    mole_state m1(.Clock_1HZ(outClk_Hz), .mole_number(mole_num), .buttons(buttons), .led(leds), .win_or_not(win_or_not));
    
    always @ (posedge clk, posedge reset) begin
        if (reset) begin
            state <= 4'b0000;
            enable <= 4'b0001;
        end else begin
            state <= nextState;
            enable <= nextEnable;
        end
    end
    
    always @ (*) begin
        case(state)
            4'b0000: begin
                nextState <= (done_0) ? 4'b0001 : 4'b0000;
                display <= (done_0) ? {score_display, display_s1} : display_s0;
                nextEnable <= (done_0) ? 4'b0010 : 4'b0001;
            end
            4'b0001: begin
                nextState <= (done_1) ? 4'b0000 : 4'b0001;
                display <= (done_1) ? display_s0 : {score_display, display_s1};
                nextEnable <= (done_1) ? 4'b0001 : 4'b0010;
            end
        endcase
    end
    
//    always @ (posedge clk or posedge reset) begin
//        if (reset)
//            leds = 5'b00000;
//        if (random_num == 3'b000) begin
//            leds[0] = 1'b1;
//            leds[4:1] = 4'b0000;
//        end else if (random_num == 3'b001 | random_num == 3'b010) begin
//            leds[4:0] = 5'b00000;
//            leds[1] = 1'b1;
//        end else if (random_num == 3'b011 | random_num == 3'b100) begin
//            leds[4:0] = 5'b00000;
//            leds[2] = 1'b1;
//        end else if (random_num == 3'b101 | random_num == 3'b110) begin
//            leds[4:0] = 5'b00000;
//            leds[3] = 1'b1;
//        end else if (random_num == 3'b111) begin
//            leds[4] = 1'b1;
//            leds[3:0] = 4'b0000;
//        end
//    end
            
            
    
    
    
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
    /*
    // Randomizer
    LFSR4 my_randomizer(.number(random_num), .clk(clk), .reset(reset));
    
    // REMEMBER TO ADD THE BUTTONS, LED TO THE CONSTRAINT FILE NORMAN DONT FORGET AHH PLEASE REMEMBER
    mole_state my_mole(.Clock_1HZ(outClk_Hz), .mole_number(random_num), .buttons(buttons), .led(led), .win_or_not(win_or_not));

    // Score Tracker
    score_cnt my_score_counter(.win_or_not(win_or_not), .reset(reset), .score(score));
    */
endmodule
