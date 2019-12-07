`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 05:12:06 PM
// Design Name: 
// Module Name: clock_divider
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

module clock_divider100MHzToTenthHz(
    input clk,
    input reset,
    output reg outClk
    );
    
    reg [28:0] count;    

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            outClk <= 0;
            count <= 0;
        end else if (count == 29'b11101110011010110010100000000) begin
            outClk <= ~outClk;
            count <= 0;
        end else 
            count <= count + 1'b1;
    end
    
endmodule

module clock_divider100MHzTo1Hz(
    input clk,
    input reset,
    output reg outClk
    );
    
    reg [25:0] count;    

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            outClk <= 0;
            count <= 0;
        end else if (count == 26'b10111110101111000010000000) begin
            outClk <= ~outClk;
            count <= 0;
        end else 
            count <= count + 1'b1;
    end
    
endmodule

module clock_divider100MHzTo1kHz(
    input clk,
    input reset,
    output reg outClk
    );
    
    reg [16:0] count;    

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            outClk <= 0;
            count <= 0;
        end else if (count == 17'b11000011010100000) begin
            outClk <= ~outClk;
            count <= 0;
        end else 
            count <= count + 1'b1;
    end
    
endmodule