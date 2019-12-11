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

module clock_divider100MHzToVarious(
    input clk,
    input reset,
    input [1:0] level,
    output reg outClk
    );
    
    reg [26:0] count;    

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            outClk <= 0;
            count <= 0;
        end else begin
            if (level == 2'b00) begin // easy
                if (count == 27'b101111101011110000100000000) begin
                    outClk <= ~outClk;
                    count <= 0;
                end else 
                    count <= count + 1'b1;
            end else if (level == 2'b01) begin //medium
                if (count == 26'b10111110101111000010000000) begin
                    outClk <= ~outClk;
                    count <= 0;
                end else 
                    count <= count + 1'b1;
            end else if (level == 2'b10) begin //hard
                if (count == 26'b01011111010111100001000000) begin
                    outClk <= ~outClk;
                    count <= 0;
                end else 
                    count <= count + 1'b1;
            end else begin //default to medium
                if (count == 26'b10111110101111000010000000) begin
                    outClk <= ~outClk;
                    count <= 0;
                end else 
                    count <= count + 1'b1;
            end
        end
    end
    
endmodule