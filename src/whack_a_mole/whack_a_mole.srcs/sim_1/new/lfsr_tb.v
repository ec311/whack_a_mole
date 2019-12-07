`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:51:24 PM
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb(
    /*input [2:0] input_num,
    input clock,
    input reset,
    output [2:0] number*/
    );
    
    //reg [0:2] input_num;
    reg clock;
    reg reset;
    wire [2:0] number;
    
    //LFSR lf(.input_num(input_num),.clock(clock),.reset(reset),.number(number));
    //LFSR2 lf2(.clock(clock),.reset(reset),.number_out(number));
    //LFSR3 lf3(.clock(clock),.reset(reset),.rnd(number));
    LFSR4 lf4(.number(number),.clk(clock),.reset(reset));
    
    initial begin;
    reset = 1;
    clock = 0;
    //input_num = 3;
    #10 reset = 0;
    end
    
    always begin
    forever #2 begin
        clock = ~clock;
    end
    //#10 input_num = input_num +1;
    end
    
endmodule
